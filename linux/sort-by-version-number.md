# Sort By Version Number

You can sort by version number using the `-V` flag.

For example, you can grab your latest git tag as follows:

```bash
git tag -n | sort -V | tail -1 | awk '{print $1}'
```
