# Rotate X-tick Labels

When you plot a time series, you usually need to rotate the x-tick labels so
that you can read the dates.

```python
import matplotlib.pyplot as plt

# define x and y somewhere
plt.plot(x, y)
plt.xticks(rotation=45)
```