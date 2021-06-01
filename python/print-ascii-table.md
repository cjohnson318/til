# Print an ASCII Table

I needed to pretty print an ASCII table for visually comparing some data, and
later sharing that data via email. One solution was `PrettyTable`. Here, we add
one row at a time.

```python
from prettytable import PrettyTable
import random

pt.field_names = ["A", "B"]
for i in range(3):
    pt.add_row([random.uniform(0,1), random.uniform(0,1)])
print(pt)
```
```
+---------------------+--------------------+
|          A          |         B          |
+---------------------+--------------------+
| 0.08361361205835316 | 0.9656697789827289 |
| 0.22408201780859394 | 0.7433186247709901 |
| 0.30245953986183527 | 0.2747904360016633 |
+---------------------+--------------------+
```

We can also add multiple rows at once.

```python
from prettytable import PrettyTable
import random

pt.field_names = ["A", "B"]
data = [[random.uniform(0,1) for _ in range(2)] for _ in range(3)]
pt.add_rows(data)
print(pt)
```
```
+---------------------+---------------------+
|          A          |          B          |
+---------------------+---------------------+
| 0.12829427296035023 | 0.34039455384333606 |
| 0.16237986127000037 |  0.8656983724296935 |
| 0.10883190531646758 |  0.7514955800774817 |
+---------------------+---------------------+
```


## Resources

[PrettyTable PYPI](https://pypi.org/project/prettytable/)