# `argmax` without NumPy

The `argmax` function is very useful, it returns the index of the (first)
maximal element of an array. The easiest way to use this is to import numpy,
but numpy is a very large module. We can write a similar function using the
builtin `max` function with its `key` argument.

```python
def argmax(x):
    return max(range(len(x)), key=lambda i: x[i])
```

Here, the first argument of `max` is a list from `0` to `len(x)`, and the `key`
argument gives the `max` function a function to use to make comparisons and
return the largest element. In this case, the `key` function maps indices of
the list `x` to the elements of `x`, and then returns the index associated with
the largest element of `x`, which is exactly what we want.