# `sed` Replace

Quickly find and replace everything in a file. In this example, replace the
string `some/path` with `another/place` in the file named `file.txt`.

```python
sed -i s'|some/path|another/place|' file.txt
```

The argument `-i` replaces the strings in the file "in place".