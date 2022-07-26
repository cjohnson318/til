# Syntax


## Install

```bash
brew install lua
```

To exit, use `CTRL+D`


## Coding


### print

Both of these work.

```lua
print 'hello'
print('hello')
```


### for-loop

We can count from 1 to n.

```lua
for i=1,5 do print(i) end
1
2
3
4
5
```

We can provide an additional step parameter.

```lua
for i=1,10,2 do print(i) end
1
3
5
7
9
```

We can also step backwards.

```lua
for i=5,1,-1 do print(i) end
5
4
3
2
1
```

We can iterate over the key-value pairs of a table as,

```lua
t = {'a', 'e', 'i', 'o', 'u'}
for key, value in pairs(t) do print(key, value) end
```

If we're interested as a table as an array or list, we can iterate as,

```lua
t = {'a', 'e', 'i', 'o', 'u'}
for index, value in ipairs(t) do print(index, value) end
```

We can also use the size of the table to iterate over its data,

```lua
t = {'a', 'e', 'i', 'o', 'u'}
for i=1,#t do print(i) end
1
2
3
4
5
for i=1,#t do print(t[i]) end
a
e
i
o
u
```


### while-loop

This should look pretty familiar.

```lua
local i = 1
while i < 5 do
  print(i)
  i = i + 1
end
```


### repeat-until-loop

Also familiar, like a do/while loop,

```lua
local i = 1
repeat
  print(i)
  i = i + 1
until i > 5
```


### strings

Concatenation,

```lua
hello = 'Hello '
user = 'user'
greeting = hello .. user
print(greeting) --> 'Hello user'
```

String literals,

```lua
someLiteral = [[
<html>
<head></head>
<body></body>
</html>
]]
```

String interpolation, sort of,

```lua
function printf(...)
    print(string.format(...))
end

printf("Hello %s!", name)
```


### tables

Define a table.

```lua
t = {foo = 'bar'}
u = {2, 3, 5}
```

Get stuff from tables.

```lua
t.foo    --> 'bar', dot access
t['foo'] --> 'bar', bracket access
u[1]     --> 2, as an array, only bracket access is supported
```

Print a table.

```lua
t = {foo='bar'}
for k, v in pairs(t) do print(k, v) end
```

Append to the end of a table.

```lua
foo = {}
table.insert(foo, "bar")
table.insert(foo, "baz")
```


### functions

Functions look kind of like Python or Ruby functions,

```lua
function sayHello(name)
    print('Hello ' .. name)
end
```


### imports

Assuming there is a file in the working directory named `utils.lua`, import it as,

```lua
u = require('utils')
u.sayHello('some name')
```

The module looks like,

```lua
local M = {}

function M.sayHello(name)
    print('Hello ' .. name)
end

return M
```


## Penlight

```bash
brew install luarocks
luarocks install penlight
```

Then, in the REPL,

```lua
require 'pl'
```

Or in a module

```lua
local utils = require 'pl.utils'
```