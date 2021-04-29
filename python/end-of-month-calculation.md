# End Of Month Calculation

```python
import calendar

year = 2020
month = 4
_, eom = calendar.monthrange(year, month) # => 30
print(f'The last day of {month}/{year} is {eom}.')
```
