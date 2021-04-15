# MDB

I wrote a small class for inspecting `.mdb` files based on the link below. I'm
putting it here so I don't loose track of it in case that Medium article 
disappears.

This process requires [mdbtools](https://github.com/mdbtools/mdbtools).

```
$ brew install mdbtools
```

Then the Python class below can access `mdbtools` using the subprocess module.

```
import pandas as pd
import subprocess


class MDBClient:
    def __init__(self, path):
        self.path = path
    def get_tables(self):
        tables = subprocess.check_output(["mdb-tables", self.path])
        result = tables.decode().split()
        return result
    def get_data(self, table):
        tables = subprocess.check_output(["mdb-export", self.path, table])
        result = tables.decode().split('\n')
        return result
    def to_df(self, table):
        d = self.get_data(table)
        columns = d[0].split(',')
        data = [i.split(',') for i in d[1:]]
        df = pd.DataFrame(columns=columns, data=data)
        return df
```

## Reference

[Reading MS Access MDB Files on Mac… when you have to do it](https://wenyu-z.medium.com/reading-ms-access-mdb-files-on-mac-969a176baa7ahttps://wenyu-z.medium.com/reading-ms-access-mdb-files-on-mac-969a176baa7a)