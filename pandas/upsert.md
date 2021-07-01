# Upsert in Pandas

I needed to do a union, but give preference to one data set over another.
Basically, this translates into an upsert ttype of operation. In pandas,
there's a method for that, the obviously named, `combine_first`.

```python
import pandas

sketchy = pandas.read_csv('sketchy-data.csv')
truthy = pandas.read_csv('truthy-data.csv')

new_index = ['name', 'phone']
sketchy.set_index(new_index)
truthy.set_index(new_index)

truthy.combine_first(sketchy) # upsert
truthy.reset_index()
```