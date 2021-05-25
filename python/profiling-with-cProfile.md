# Profiling with cProfile

The `cProfile` module can be used to find bottlenecks and compare
implementations. You can use `cProfile` from the command line.

```bash
python3 -m cProfile <script.py>
```

Here is an example of profiling a recursive Fibonacci function.

```python
# recursive-fibonacci.py

def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

if __name__ == '__main__':
    print(fibonacci(32))
```

And this returns,

```bash
$ python3 -m cProfile recursive-fibonacci.py
2178309
         7049159 function calls (5 primitive calls) in 1.706 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    1.706    1.706 recursive-fibonacci.py:1(<module>)
7049155/1    1.706    0.000    1.706    1.706 recursive-fibonacci.py:4(fibonacci)
        1    0.000    0.000    1.706    1.706 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```

Since we're printing out `fibonacci(12)`, the value `2178309` is our result.

The line `7049159 function calls (5 primitive calls) in 1.706 seconds` tells us
that there were **7049159** total function calls, in **1.706** seconds. The
`primitive calls` refers to the number of **non-recursive** calls.

We can add LRU Cache from functools to bring this down somewhat.

```python
# lru-fibonacci.py

from functools import lru_cache

@lru_cache
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

if __name__ == '__main__':
    print(fibonacci(32))
```

This gives us,

```bash
$ python3 -m cProfile lru-fibonacci.py
2178309
         55 function calls (23 primitive calls) in 0.000 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 functools.py:35(update_wrapper)
        1    0.000    0.000    0.000    0.000 functools.py:478(lru_cache)
        1    0.000    0.000    0.000    0.000 recursive-fibonacci.py:1(<module>)
     33/1    0.000    0.000    0.000    0.000 recursive-fibonacci.py:3(fibonacci)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.callable}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
        7    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
        2    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
        5    0.000    0.000    0.000    0.000 {built-in method builtins.setattr}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
```

And finally, we can do an incremental version,

```python
# incremental-fibonacci.py

def fibonacci(n):
    n1, n2 = 0, 1
    if n < 2:
        return n
    for _ in range(1,n+1):
        f = n1 + n2
        n1, n2 = f, n1
    return f

if __name__ == '__main__':
    print(fibonacci(32))
```

Since there is no recursion, we don't see any mention of `primitive calls`.

```bash
$ python3 -m cProfile incremental-fibonacci.py
2178309
         5 function calls in 0.000 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 incremental-fibonacci.py:1(<module>)
        1    0.000    0.000    0.000    0.000 incremental-fibonacci.py:1(fibonacci)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```
