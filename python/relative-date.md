# Relative Dates

If you want time implement a trailing twelve months (TTM) report, then you can
calculate the date twelve months ago as,

```python
import datetime
from dateutil.relativedelta import relativedelta

earlier_date = datetime.datetime.now() + relativedelta(months=-12)
```

The negative 12 tells the relative delta to count backwards in time.