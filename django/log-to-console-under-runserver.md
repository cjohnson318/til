# Log to Console Under Runserver

There are better ways to do this with the logging module,
but the quick and dirty way is this:

```python
import sys

print("Some important message.", file=sys.stderr)
```