# `rsync`

This is like a faster, more fully featyred `cp` utility.

To back up a directory, recursively, with a progress bar:

```bash
rsync -aP [SOURCE] [DESTINATION]
```

Make sure the source directory has a trailing slash.

If you're sending a single file over, then use the absolute path to that file.
