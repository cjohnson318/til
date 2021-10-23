# Multiprocessing

Big takeaway: the business part of your code needs to be in your `__main__`
block. Here's an example:

```python
import multiprocessing as mp

def func(args):
    ...
    # return the args along with the result
    # since your results might be shuffled together
    return args, result

if __name__ == '__main__':
    # args is a list of things you want to work on in parallel
    args = [item for item in items]
    # "business end" of the code
    with mp.Pool(PROCS) as pool:
        result = pool.map(func, args)
    # do some stuff with the result
```