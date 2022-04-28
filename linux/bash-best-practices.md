# BASH Best Practices

Start your script with this.

```bash
#!/usr/bin/env bash

# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't hide errors within pipes
set -o pipefail
```


## Resources

- [`bertvv` blog](https://bertvv.github.io/cheat-sheets/Bash.html)
- [`bertvv` github](https://github.com/bertvv/cheat-sheets)