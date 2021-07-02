# Grep - Show Filenames Only

The normal `grep` output I had returned too much noise, but I learned I could
turn most of that off and focus on the filenames.

Here, `-r` tells `grep` to look inside all subdirectories and files of
`/path/to/dir`, and `-l` supresses the actual matched text, eaving only the
matching filename and path. 

```bash
grep -rl "query" /path/to/dir
```