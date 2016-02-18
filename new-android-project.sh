#!/bin/bash
if [ -z $ANDROID_HOME ]; then
    echo "Error: \$ANDROD_HOME enviroment is not set. This is needed to know the location of the Android SDK"
    exit 1
fi
command="/tools/android"
android=$ANDROID_HOME$command

if [ -z $1 ]; then
    echo "Usage is: $0 <directory>"
    exit 1
fi

echo "New Android Project"
echo -e "Directory: $1\n"

# gather info about the project
echo "Project name? [$1]"
read name
if [ -z $name ]; then
    name=$1
fi

echo "Company name? [empty]"
read company
com="com"
if [ -z $company ]; then
    defaultpackage=$com.$name
else
    defaultpackage=$com.$company.$name
fi

echo "Package name? [$defaultpackage]"
read package
if [ -z $package ]; then
    package=$defaultpackage
fi

echo "Default Activity? [MainActivity]"
read activity
if [ -z $activity ]; then
    activity="MainActivity"
fi

echo "API target? [23]"
read api
if [ -z $api ]; then
    api=23
fi

echo "Min SDK? [14]"
read minsdk
if [ -z $minsdk ]; then
    minsdk=14
fi

echo "Android Gradle Plugin version? [1.5.0]"
read gradleplugin
if [ -z $gradleplugin ]; then
    gradleplugin="1.5.0"
fi

echo "Gradle version? [2.2]"
read gradleversion
if [ -z $gradleversion ]; then
    gradleversion="2.2"
fi

echo -e "\nBuilding project..\n"

# gather target id for API level
id="$($android list targets | grep -B 3 'API level: 23' | grep -o 'id: [0-9]\+' | grep -o '[0-9]\+')"
# create the project
mkdir -p $1
$android create project --target $id --name $name --path $1 --activity $activity --package $package --gradle --gradle-version $gradleplugin
# fix outdated gradle template
sed -i 's/runProguard false/minifyEnabled false/g' $1/build.gradle
sed -i "s/gradle-1.12/gradle-$gradleversion/g" $1/gradle/wrapper/gradle-wrapper.properties
# add min-sdk
androidconfig="\ \n    defaultConfig { \n        applicationId '$package' \n        minSdkVersion $minsdk \n        targetSdkVersion $api \n    }"
sed -i "/buildToolsVersion/a $androidconfig" $1/build.gradle

echo -e "\nDone"
