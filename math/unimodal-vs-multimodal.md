# Unimodal versus Multimodal

Hartigan's Dip Test is used to determine whether a distribution is unimodal or
multimodal. The Python module UniDip implements this test, and will return an
upper and lower limit for each mode of a distribution. If the distribution is
unimodal, then it will just return a single pair of limits.

To motivate this, let's create a unimodal and bimodal distribution.

```python
import numpy as np

N = 40
unimodal = np.random.normal(0, 1, N)

N = 40
Y = 20 # I don't remember what Y is short for :/
distance = 5 # distance between modes
x0 = np.random.normal(0, 1, Y)
x1 = np.random.normal(distance, 1, N-Y)
bimodal = np.hstack((x0, x1))
```

Now that we have a unimodal and bimodal distribution, we can look at the dip
test. These limits refer to the indices of the sorted data.

```python
>>> from unidip import UniDip
>>> UniDip(unimodal).run()
[(0, 39)]
>>> UniDip(bimodal).run()
[(2, 16), (23, 38)]
```