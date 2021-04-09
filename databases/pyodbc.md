# Examples of `pyodbc`

Create a connection,

```python
import pyodbc

DRIVER = '{ODBC Driver 17 for SQL Server}'
IPADDR = ...
PORTNO = ...
DATABASE = ...
USER = ...
PASSWORD = ...

connection_string = f'DRIVER={DRIVER};SERVER={IPADDR},{PORTNO};DATABASE={DATABASE};UID={USER};PWD={PASSWORD}'
connection = pyodbc.connect(connection_string)
cursor = connection.cursor()
```

Get a list of database tables,

```python
tables = cursor.tables()
```

Get a list of columns for a table,

```python
columns = cursor.columns(tables[0])
```

Get primary and foreign keys,

```python
pks = cursor.primaryKeys(tables[0])
fks = cursor.foreignKeys(tables[0])
```

Get table data,

```python
cursor.execute(f'SELECT * FROM {tables[0]};')
data = cursor.fetchall()
```