# Move Files

There's several ways to do this, but I prefer using `shutils` for file
operations.

```python
import shutil

shutil.move('/original/path/to/file', '/new/path/to/file')
```

## Reference

[`shutil` Documentation](https://docs.python.org/3/library/shutil.html)