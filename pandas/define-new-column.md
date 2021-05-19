# Define a New Column

There's a couple of ways to do this. The most straightforward is,

```python
import numpy
import pandas

# set up dummy data
data = numpy.random.rand(5,2)
columns = ['A', 'B']
df = pandas.DataFrame(data, columns=columns)

# define new column
df['C'] = 2 * df['A'] - df['B']
```

The other way to do this is to use the `assign` method.

```python
import numpy
import pandas

# set up dummy data
data = numpy.random.rand(5,2)
columns = ['A', 'B']
df = pandas.DataFrame(data, columns=columns)

# define new column
df = df.assign(C=lambda x: 2 * x['A'] - x['B'])
```

You don't *have* to use a `lambda` here, it's probably more readable to put
that logic in its own function.

```python
import numpy
import pandas

# set up dummy data
data = numpy.random.rand(5,2)
columns = ['A', 'B']
df = pandas.DataFrame(data, columns=columns)

def new_column_C(x: pandas.DataFrame) -> pandas.Series:
    '''Double column A, then subtract column B.
    '''
    result = 2 * x['A'] - x['B']
    return result

# define new column
df = df.assign(C=new_column_C)
```

## Reference

[Official Documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.assign.html)