# Grep

## Filter by File Type

Only look at Python files; good for excluding things in `__pycache__/`. The 
`--exclude` flag works similarly.

```bash
grep -r "query" /path/to/dir --include \*.py
```

## Include Line Numbers

```bash
grep -r "query" /path/to/dir -n
```

## Show Filenames Only

The `-l` flagsupresses the actual matched text, leaving only the matching
filename and path. 

```bash
grep -rl "query" /path/to/dir
```
