# Abstract Base Classes

The simplest way to do this is to import `ABC` and `abstractmethod`.

```python
class DataSet(ABC):

    @abstractmethod
    def extract(self):
        pass

    @abstractmethod
    def transform(self):
        pass

class SomeDataSet(DataSet):

    def __init__(self, filename):
        self.filename = filename
        self.df

    def extract(self):
        pass

    def transform(self):
        pass

ds = SomeDataSet('path/to/somwhere.csv')
```

If we do not implement the methods `extract()` *and* `transform()`, then the
`abc` module will raise an error when we instantiate the `ds` object.