# Find Duplicates

You can find duplicate records, with respect to subsets of columns using the
`duplicated` method. For example, if you want to find records with the same
name and phone number, but igoring all other fields, then you can do the
following.

```python
import pandas

df = pandas.read_csv('address-book.csv')
dupes = df[df.duplicated(subset=['name', 'phone_number'])]
```

Similarly, you can drop duplicates.

```python
import pandas

df = pandas.read_csv('address-book.csv')
df = df.drop_duplicates(subset=['name', 'phone_number'])
```