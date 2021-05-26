# Filter by `datetime`

To filter a column by `datetime` we can usually do the following,

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

older_df = df[df.date < '2021-05-26']
```

However, if that doesn't work, try this,

```python
older_df = df[df.date.dt.strftime('%Y-%m-%d') < '2021-05-26']
```

