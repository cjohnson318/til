# Variables: `var`, `let`, and `const`

**TL;DR: Use `let` and `const`.**

A `var` variable declaration is not limited to its enclosing scope, and it is
generally considered harmful, or potentially dangerous.

A `let` declaration is limited to its enclosing scope, do it is easier to
reason about.

A `const` declaration is a constant, and cannot be redefined, but if a `const`
variable is an `object` or an `array`, it's elements can be updated or removed.


## Reference

- [MDN docs for `const`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const)