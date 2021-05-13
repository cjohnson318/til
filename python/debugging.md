# Debugging

The simplest way to perform debugging is to use `pdb`.

```python
import pdb

def doubler(x):
    pdb.set_trace()
    result = 2 * x
    return result

doubler(2.5)
```

This will bring up an interactive session where you can inspect variables, and
step forwards and backwards through the function, starting at `pdb.set_trace()`.

Here is an incomplete summary of the commands you can use. Here, `n[ext]` means
`n` or `next`.

| Command          | Comment                                   |
|------------------|-------------------------------------------|
| `n[ext]`         | Run the next line.                        |
| `s[tep]`         | Step into a line.                         |
| `r[eturn]`       | Run until the current function returns.   |
| `c[ontinue]`     | Run until the next break point.           |
| `p[rint] <expr>` | Print an expression in the current scope. |
| `pp <expr>`      | Pretty print an expression.               |
| `q[uit]`         | Quit the debugger.                        |
| `h[elp]`         | Show the help.                            |
| `h[elp] <cmd>`   | Show help for a single command.           |

If you're in a Jupyter Notebook, or Lab, you can use `pdb` or the following,
which provides syntax highlighting.

```python
from IPython.core.debugger import set_trace
```

## Reference

[Official Documentation](https://docs.python.org/3/library/pdb.html)
