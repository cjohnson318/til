# Default Values for User Input

Recently, I discovered I could quickly label training data by using a for loop
and Python's `input()` method to provide a label for the data. If you want to
avoid inputting data each iteration, you can define a default value for
`input()`.

When a user does not provide any data, and just presses Return, `input()` will
return an empty string to the script. Since empty strings are *Falsey* in
Python, we can use an `or` operator to provide a sensible default.

```python
data = input("Provide some data:") or "sensible default"
print(data)
```

When this code is run, if you do not provide any data and just hit Return, then
the string, `"sensible defualt"`, will be stored in the variable `data`.