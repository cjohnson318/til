# Encryption with GNU PGP

Install on a Mac with:

```bash
brew install gnupg
```

Confirm installation with:

```bash
gpg --help
```

Encrypt a file symmetrically with a password:

```bash
gpg --symmetric some-file.txt
```

That will create a binary file `some-file.txt.gpg`.

To create and ASCII file,

```bash
gpg --armor --symmetric some-file.txt
```

That will create `some-file.txt.asc`.

To decrypt, use:

```bash
gpg --decrypt some-file.txt.asc
gpg -d some-file.txt.asc
```