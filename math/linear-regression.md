# Linear Regression

There's *lots* of ways to do this, and it is a *very* big topic, so I will add
to this file in a piecemeal fashion.

## statsmodels

Here, `df` is a `pandas.DataFrame` that has the columns `Kriged` and 
`SixMoCumOilNorml7k`, and we'd like to create a linear regression for `Kriged`
as a function of `SixMoCumOilNorml7k`. That is what the shortand in the
argument `formula="Kriged ~ SixMoCumOilNorml7k"` means.

The output is kept in `result.summary()`; simply trying to say `print(result)`
will not work.

```python
import statsmodels.formula.api as sm

result = sm.ols(formula="Kriged ~ SixMoCumOilNorml7k", data=df).fit()
print(result.summary())
                            OLS Regression Results                            
==============================================================================
Dep. Variable:                 Kriged   R-squared:                       0.101
Model:                            OLS   Adj. R-squared:                  0.095
Method:                 Least Squares   F-statistic:                     16.88
Date:                Thu, 01 Apr 2021   Prob (F-statistic):           6.49e-05
Time:                        11:29:40   Log-Likelihood:                -1774.7
No. Observations:                 153   AIC:                             3553.
Df Residuals:                     151   BIC:                             3559.
Df Model:                           1                                         
Covariance Type:            nonrobust                                         
======================================================================================
                         coef    std err          t      P>|t|      [0.025      0.975]
--------------------------------------------------------------------------------------
Intercept            3.16e+04   6714.303     17.271      0.000    1.03e+05    1.29e+05
SixMoCumOilNorml7k     0.9103      0.041      4.109      0.000       0.088       0.252
==============================================================================
Omnibus:                       18.497   Durbin-Watson:                   0.210
Prob(Omnibus):                  0.000   Jarque-Bera (JB):               26.910
Skew:                          -0.666   Prob(JB):                     1.43e-06
Kurtosis:                       4.565   Cond. No.                     5.07e+05
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
[2] The condition number is large, 5.07e+05. This might indicate that there are
strong multicollinearity or other numerical problems.
```