# Replace `np.nan` with `None`

By default, pandas uses `np.nan` for missing values. For example, if you open a
CSV using `pandas.read_csv(...)` and there are empty fields, then they'll show
up as `np.nan` in you DataFrame. However, when you're processing that DataFrame
then you need to check for empty fields using `np.nan`, instead of the more
Pythonic `None`, so I like to replace `np.nan` with `None` beforehand so I
don't have to deal with `np.nan` later.

```python
import pandas

filename = 'test.csv'
columns = [
    'some',
    'columns',
    'to',
    'read',
]

df = pandas.read_csv(open(filename, 'r'), usecols=columns)
df = df.where(df.notnull(), None)
```