# Stripes
A SmartNote applications making your note-taking easier.

# Important (Arch Linux)
Set your JDK's on `android/gradle.properties` if you installed latest JDK's into your system:
```
org.gradle.java.home=/usr/lib/jvm/java-21-openjdk
```
And install JDK 21 into your system.
```
sudo pacman -S jdk21-openjdk
```
OR just install JDK 21 into your system then set JDK 21 as the default:
```
sudo pacman -S jdk21-openjdk && sudo archlinux-java set java-21-openjdk
```
# Development Guide
1. Run Flutter Pub Get
```
flutter pub get
```

2. Run Project
```
flutter run --debug
```
