@echo off

:: Build the APK
flutter build apk --release

:: Rename the APK
move build\app\outputs\flutter-apk\app-release.apk build\app\outputs\flutter-apk\myapp.apk

echo APK has been renamed to myapp.apk
