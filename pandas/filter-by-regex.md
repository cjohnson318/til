# Filter By Regex

> Some people, when confronted with a problem, think "I know, I'll use regular
> expressions." Now they have two problems. --Jamie Zawinski

Jokes aside, I love regex. Here's how you filter data in a pandas DataFrame
using regex. Suppose we have a csv of addresses, with a `street` column, and we
want to find Sesame Street, then we would reference that column, use the `str`
attribute, and use the `match()` method. The kicker is remembering to use the
`str` attribute before using the `match()` or `contains()` methods.

```python
import pandas

df = pandas.read_csv('addresses.csv')
result = df[df['street'].str.match(r'Sesame')]
```

## References

- [Series.str.match()](https://pandas.pydata.org/docs/reference/api/pandas.Series.str.match.html)
- [Series.str.contains()](https://pandas.pydata.org/docs/reference/api/pandas.Series.str.contains.html)