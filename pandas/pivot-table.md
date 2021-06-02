# Pivot Table

Let's model how much spare change you come home with over the course of three
days.

```python
import pandas
import random

sample_dates = ['2021-06-01']*3 + ['2021-06-02']*2 + ['2021-06-03']
coins = ['quarter', 'dime', 'nickel', 'penny']
value_map = dict(zip(coins, [0.25, 0.1, 0.05, 0.01]))

for i in range(10):
    coin = random.sample(coins, 1)[0]
    count = random.sample([1,1,1,2,2,3,4], 1)[0]
    amt = count * value_map[coin]
    data.append({
        'date': random.sample(sample_dates, 1)[0],
        'coin': coin,
        'count': count,
        'value': amt,
    })

df = pandas.DataFrame(data)
```

At this point, the data frame might look like this:

```
         date     coin  count  value
0  2021-06-03     dime      1   0.10
1  2021-06-01   nickel      1   0.05
2  2021-06-02  quarter      1   0.25
3  2021-06-01    penny      2   0.02
4  2021-06-03     dime      1   0.10
5  2021-06-01  quarter      3   0.75
6  2021-06-02     dime      3   0.30
7  2021-06-03     dime      2   0.20
8  2021-06-03  quarter      1   0.25
9  2021-06-02     dime      2   0.20
```

Then we can use `pandas.pivot_table` to summarize this data. We can look at the
total value over time.

```python
pandas.pivot_table(
    df,
    index='coin',
    columns='date',
    values='value',
    aggfunc=sum,
    fill_value=0,
    margins=True,
)
```
```
date     2021-06-01  2021-06-02  2021-06-03   All
coin
dime           0.00        0.50        0.40  0.90
nickel         0.05        0.00        0.00  0.05
penny          0.02        0.00        0.00  0.02
quarter        0.75        0.25        0.25  1.25
All            0.82        0.75        0.65  2.22
```

The `aggfunc=sum` argument tells the pandas to summarize the data by summing
the `values='value'` column. The `fill_value=0` argument sets missing data to 0
instead of `NaN`. The `margins=True` argument creates the last row and column
of subtotals, and the grand total.

We can also look at the total counts of different denominations.

```python
pandas.pivot_table(
    df,
    index='coin',
    columns='date',
    values='count',
    aggfunc=sum,
    fill_value=0,
    margins=True,
)
```
```
date     2021-06-01  2021-06-02  2021-06-03  All
coin
dime              0           5           4    9
nickel            1           0           0    1
penny             2           0           0    2
quarter           3           1           1    5
All               6           6           5   17
```
