# Grep

## Filter by File Type

Only look at Python files; good for excluding things in `__pycache__/`. The 
`--exclude` flag works similarly.

```bash
grep -r "query" /path/to/dir --include \*.py
```

## Include Line Numbers

```bash
grep -rn "query" /path/to/dir
```

## Show Filenames Only

The `-l` flagsupresses the actual matched text, leaving only the matching
filename and path. 

```bash
grep -rl "query" /path/to/dir
```

## Words Starting/Ending With...

Use `\b` to signal word break.

To match "something" or "someone",

```bash
grep -r "\bsome" /path/to/dir
```

To match "somthing" or "anything",

```bash
grep -r "thing\b" /path/to/dir
```