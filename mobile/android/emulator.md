# Emulator

On my machine, I downloaded the following version of Android Studio,  on 2022-10-26.

```
Android Studio Dolphin | 2021.3.1 Patch 1
Build #AI-213.7172.25.2113.9123335, built on September 29, 2022
Runtime version: 11.0.13+0-b1751.21-8125866 aarch64
VM: OpenJDK 64-Bit Server VM by JetBrains s.r.o.
macOS 12.5.1
GC: G1 Young Generation, G1 Old Generation
Memory: 2048M
Cores: 10
Registry:
    external.system.auto.import.disabled=true
    ide.text.editor.with.preview.show.floating.toolbar=false
```

I set the following environment variables at the end of `.zshrc`.

```bash
# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"
```

I put `emulator/` before the `platform-tools/` according to [this](https://issuetracker.google.com/issues/37137213#comment24) message board comment.

Then, to start an emulator, I use the `emulator` util as,

```bash
emulator -avd <avd>
```

Where `<avd>` is one of those listed by the command,

```bash
emulator -list-avds
  - Nexus_10_API_33
  - Nexus_7_2012_API_33
```

YMMV.