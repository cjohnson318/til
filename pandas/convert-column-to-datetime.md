# Convert Column to `datetime`

To filter a `pandas.DataFrame` by date or time, you need to cast or convert the
column to the type `datetime`, assuming it isn't already.

```python
import pandas

columns = ['date', 'value']
data = [
    ['2021-05-24', 2.1],
    ['2021-05-25', 3.4],
    ['2021-05-26', 1.3],
]
df = pandas.DataFrame(data, columns=columns)

df.date = pandas.to_datetime(df.date)
```