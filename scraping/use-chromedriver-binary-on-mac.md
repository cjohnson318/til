# Use the `chromedriver` Binary on a Mac

Recently, I updated my Mac, and all of a sudden it doesn't trust `chromedriver`
any longer. To fix the issue I ran this from the working directory.

```bash
xattr -d com.apple.quarantine chromedriver
```