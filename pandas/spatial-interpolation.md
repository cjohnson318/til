# Spatial Interpolation

Suppose you have a dataset with latitude, longitude, and some variable
associated with the latitude/longitude pairs. Suppose you have another dataset
with just latitude and longitude pairs and you'd like to estimate the value of
the variable in your first dataset at the locations in your second dataset.

We can do this using pandas DataFrame, and an sklearn regressor, or any class
that has a `fit()` and `predict()` method.

```python
import pandas
from sklearn.neighbors import KNeighborsRegressor

def associate_new_geofeature(
    primary: pandas.DataFrame,
    primary_features: list,
    primary_target: str,
    aux: pandas.DataFrame,
    aux_features: list,
    aux_target: str,
    regressor=None,
    **kwargs
):
    '''Interpolate spatially distributed variable from one dataset in another dataset.
    
    Args:
        primary: pandas.DataFrame - Dataset that needs interpolated variable.
        primary_features: list    - List of strings that represent latitude and longitude.
        primary_target: str       - Name of new variable that will be created/overwritten.
        aux: pandas.DataFrame     - (Auxillary) Dataset that has spatially distributed variable.
        aux_features: list        - List of strings that represent latitude and longitude,
                                    same order as argument `primary_features`.
        aux_target: str           - Name of the variable that will be used for interpolation.
        regressor: class          - Class that will be used for spatial regression.
                                    Must have `fit()` and `predict()` methods.
        **kwargs                  - Arguments that will be supplied to `regressor`.
    
    Retruns:
        pandas.DataFrame - Copy of arg `primary`, with new column of interpolated variable.
    '''
    result = primary.copy()
    if regressor is None:
        model = KNeighborsRegressor(n_neighbors=5, weights='distance')
    else:
        model = regressor(**kwargs)
    aX = aux[aux_features]
    ay = aux[aux_target]
    model.fit(aX, ay)
    result[primary_target] = model.predict(result[primary_features])
    return result
```