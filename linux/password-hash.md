# Password Hash

To hash a password on Ubuntu, like what you see in `/etc/shadow`, use the
following.

```bash
mkpassword -m sha-512 -s <salt> -R 5000
```

This command will prompt you to type in the password, and then send a hash to
the stdout.

The `-s` option is the salt, what's between the last pair of `$` in the result, and the `-R` option is the number of rounds that the hash goes through.