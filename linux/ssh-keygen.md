## SSH Key Generation

Run the following command, and then specify a name for your SSH key.

```bash
ssh-keygen -t ed25519 -C "your@email.com"
```

Then, to copy your public key,

```bash
pbcopy < your-key.pub
```