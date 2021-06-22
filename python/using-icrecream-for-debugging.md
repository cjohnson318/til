# Using `icecream` for Debugging

## Install

```bash
python3 -m venv venv
source venv/bin/activate
pip install icecream
```

## Getting Started

```python
import sys
from icecream import ic

def yell(x: str) -> str:
    x = x.upper()
    ic(x)
    return x + '!!!'

if __name__ == '__main__':
    result = ic(yell(ic(sys.argv[1])))
    ic(result)
```

Output:

```bash
ic| sys.argv[1]: 'foo'
ic| x: 'FOO'
ic| yell(ic(sys.argv[1])): 'FOO!!!'
ic| result: 'FOO!!!'
```

## Adding More Contextt

```python
import sys
from icecream import ic
ic.configureOutput(includeContext=True)

def yell(x: str) -> str:
    x = x.upper()
    ic(x)
    return x + '!!!'

if __name__ == '__main__':
    result = ic(yell(ic(sys.argv[1])))
    ic(result)
```

Output:

```bash
ic| driver.py:14 in <module>- sys.argv[1]: 'foo'
ic| driver.py:10 in yell()- x: 'FOO'
ic| driver.py:14 in <module>- yell(ic(sys.argv[1])): 'FOO!!!'
ic| driver.py:15 in <module>- result: 'FOO!!!'
```

## Disabling/Enabling `icecream`

```python
import sys
from icecream import ic
ic.configureOutput(includeContext=True)

def yell(x: str) -> str:
    x = x.upper()
    ic(x)
    return x + '!!!'

if __name__ == '__main__':
    ic.disable()
    result = ic(yell(ic(sys.argv[1])))
    ic.enable()
    ic(result)
```

Output:

```bash
python driver.py foo
ic| driver.py:17 in <module>- result: 'FOO!!!'
```