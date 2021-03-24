# Entropy and Information Gain

This example uses `pandas.DataFrame` as a basic data structure.

```python
from math import log2
import numpy
import pandas
from typing import Tuple, List

def entropy(df: pandas.DataFrame, target: str) -> float:
    '''Calculate entropy of target column.
    '''
    N = len(df)
    labels = df[target].unique()
    classes = [len(df[df[target]==label]) / N for label in labels]
    class_entropy = [prob * log2(prob) for prob in classes]
    return -sum(class_entropy)

def conditional_entropy(df: pandas.DataFrame, target: str, variable: str, value: float) -> float:
    '''Calculate entropy conditioned on splitting data set based on value of one variable.
    '''
    N = len(df)
    df1 = df[df[variable] <= value]
    df2 = df[df[variable] > value]
    p1 = len(df1) / N
    p2 = len(df2) / N
    return (p1*entropy(df1, target) + p2*entropy(df2, target))

def information_gain(df: pandas.DataFrame, target: str, variable: str, value: float) -> float:
    '''Total entropy minus entropy conditioned on one variable.
    '''
    return entropy(df, target) - conditional_entropy(df, target, variable, value)

def information_grid(df: pandas.DataFrame, target: str, variable: str, grid: int) -> Tuple[List, List]:
    '''Calculate IG for multiple quantiles of one variable.
    '''
    vmin = df[variable].min()
    vmax = df[variable].max()
    quantiles = numpy.linspace(vmin, vmax, grid+2)[1:-1]
    gains = []
    for q in quantiles:
        ig = information_gain(df, target, variable, q)
        gains.append(ig)
    return list(quantiles), gains

# EXAMPLE #

import matplotlib.pyplot as plt 
import sklearn

iris = sklearn.datasets.load_iris()
iris_data = numpy.hstack((iris.data, numpy.reshape(iris.target, (len(iris.target), 1))))
columns = [
    'sepal_width',
    'sepal_length',
    'petal_width',
    'petal_length',
    'classification',
]
df = pandas.DataFrame(data=iris_data, columns=columns)

quantile, gain = information_grid(df, target='classification', variable='sepal_width', grid=24)
plt.plot(quantile, gain)
plt.xlabel('Quantiles')
plt.ylabel('Information Gain')
```

## Reference

[Information Gain and Mutual Information for Machine Learning](https://machinelearningmastery.com/information-gain-and-mutual-information/)