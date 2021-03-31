# Drop Rows or Columns with Missing Data

Some APIs may not handle missing values so you might need to drop some rows or
columns if you cannot impute (make up) values.

```python
# drop rows
df = df.dropna(axis=0)

# drop columns
df = df.dropna(axis=1)
```