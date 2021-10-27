# Install Flutter [2021-10-27]

  1. Download the zip from the webiste: [https://flutter.dev/docs/get-started/install/macos](https://flutter.dev/docs/get-started/install/macos)
  2. Unzip the archive.
  3. Add to your bash profile:
```bash
# for flutter
export PATH="`pwd`/flutter/bin:$PATH"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
```
  4. Run `brew install --cask android-studio`
  5. Run `brew install --cask android-SDK`
  6. Maybe run `brew install --cask homebrew/cask-versions/temurin8` for `android-sdk`
  7. Run `brew install --cask android-ndk`
  8. Run `brew install cocoapods`
  9. Open Android Studio, install any/all updates. (At this point I'm just installing anything and everything.)
  10. Drink a beer, and question life choices.
  11. From Android Studio, find the SDK Manager, and download command line tools.
  12. Run `softwareupdate --all --install --force`
  13. Run `flutter doctor --android-licenses`
  14. For argument sake, run `brew install flutter` and `brew install dart`
  15. Run `sudo gem uninstall cocoapods && sudo gem install cocoapods` because of the error quoted below:

```
[!] Xcode - develop for iOS and macOS
    ✗ CocoaPods installed but not working.
        You appear to have CocoaPods installed but it is not working.
        This can happen if the version of Ruby that CocoaPods was installed with is different from
        the one being used to invoke it.
        This can usually be fixed by re-installing CocoaPods.
      To re-install see https://guides.cocoapods.org/using/getting-started.html#installation for
      instructions.
```

Kind of a mess.