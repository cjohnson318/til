# Git Tags

## Creation

```bash
git tag -a 'v0.0.0' -m 'Message'
```

## List All Tags

```bash
git tag -n
```

Sort tags by version.

```bash
git tag -n | sort -V
```

## Publication

By default, tags aren't pushed up to the server.

```bash
git push origin --tags
```