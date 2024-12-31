# Exclude a directroy when using zip

When zipping, you can exclude a directory by using the `-x` option.

```bash
zip -r archive.zip ./project/ -x '.git*'
```
