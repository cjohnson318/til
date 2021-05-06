# Break Big Data into Chunks

If you have a very large CSV that will not fit into a single DataFrame, then
you can iterate ofer that DataFrame and work on smaller DataFrames. All of your
business logic stays mostly the same, you just wrap it in a foor-loop.

Caveat: `pandas.DataFrame` provides the `chunksize` argument to handle this. In
most APIs, `chunksize` is in bytes, but in pandas, this refers to the number of
**rows** each sub-DataFrame should have.

In this example, we create a roughly 10 million line, 550 MB file, and then we
iterate over it in million line chunks in the function `show_data_chunks(...)`.

```python
import os
import pandas
import random

N = 10_000_000
filename = 'data.csv'

def make_data(filename: str) -> None:
    with open(filename, 'w') as fh:
        fh.write('x,y,z\n')
        for _ in range(N):
            fh.write(f'{random.random()},{random.random()},{random.random()}\n')

# alternatively, use pandas.read_csv(filename, chunksize=1_000_000)
def show_data_chunks(filename: str) -> None:
    for df in pandas.read_csv(open(filename, 'rb'), chunksize=1_000_000):
        print(df.head())

if __name__ == '__main__':
    if not os.path.isfile(filename):
        make_data(filename)
    show_data_chunks(filename)
```