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


def conditional_entropy_numeric(df: pandas.DataFrame, target: str, variable: str, value: float) -> float:
    '''Calculate entropy conditioned on splitting numerical column of data set based on value of one variable.
    '''
    N = len(df)
    df1 = df[df[variable] <= value]
    df2 = df[df[variable] > value]
    p1 = len(df1) / N
    p2 = len(df2) / N
    e1 = entropy(df1, target)
    e2 = entropy(df2, target)
    result = p1*e1 + p2*e2
    return result


def conditional_entropy_categorical(ddf: pandas.DataFrame, target: str, variable: str) -> float:
    '''Calculate entropy conditioned on splitting categorical column of data set.
    '''
    N = len(df)
    dfs, ps, es = [], [], []
    categories = df[variable].unique()
    for cat in categories:
        df0 = df[df[variable]==cat].copy()
        dfs.append(df0)
        ps.append(len(df0)/N)
        es.append(entropy(df0, target))
    result = numpy.dot(es, ps)
    return result


def conditional_entropy(df, target, variable, value=None) -> float:
    '''Calculate entropy conditioned on numerical or categorical column.
    '''
    if type(value) in [int, float]:
        return conditional_entropy_numeric(df, target, variable, value)
    if value is None:
        return conditional_entropy_categorical(df, target, variable)


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