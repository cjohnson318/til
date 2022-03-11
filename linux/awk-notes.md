# awk Notes

Return the last line of a file:

```bash
cat file | awk 'END{print}'
```

Return the first column of a file:

```bash
cat file | awk '{ print $1 }'
```

Return the last column of a file:

```bash
cat file | awk '{ print $NF }'
```

Return the first and last lines of a file:

```bash
cat file | awk '{ print $1,  $NF }'
```