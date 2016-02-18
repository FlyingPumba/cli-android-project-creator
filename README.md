# Command line Android Project Creator

Useful tool to quickly create an Android project with the build.gradle file already configured.

Just run ```./new-android-project.sh <directory>```, and smash the enter key until it's done.
If you want, you can configure several project settings like: package name, min sdk, Android Gradle plugin version, etc.

**Note:** you will need the ```$ANDROID_HOME``` enviroment variable pointing to your Android SDK folder, in order to use the _android_ tool.

```
user@android:~/cli-android-project-creator$ ./new-android-project.sh test

New Android Project
Directory: test

Project name? [test]

Company name? [empty]

Package name? [com.test]

Default Activity? [MainActivity]

API target? [23]

Min SDK? [14]

Android Gradle Plugin version? [1.5.0]

Gradle version? [2.2]


Building project..

Created directory /home/ivan/src/cli-android-project-creator/test/src/main/java
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/java/com/test
Added file test/src/main/java/com/test/MainActivity.java
Created directory /home/ivan/src/cli-android-project-creator/test/src/androidTest/java
Created directory /home/ivan/src/cli-android-project-creator/test/src/androidTest/java/com/test
Added file test/src/androidTest/java/com/test/MainActivityTest.java
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/values
Added file test/src/main/res/values/strings.xml
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/layout
Added file test/src/main/res/layout/main.xml
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/drawable-xhdpi
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/drawable-hdpi
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/drawable-mdpi
Created directory /home/ivan/src/cli-android-project-creator/test/src/main/res/drawable-ldpi
Added file test/src/main/AndroidManifest.xml
Added file test/build.gradle
Created directory /home/ivan/src/cli-android-project-creator/test/gradle/wrapper

Done
```
