# SSH Config

If you normally write an SSH command like this:

```bash
ssh -i ~/.ssh/<private-key> <username-on-remote-server>@<public-DNS-or-IP-of-remote-server>
```

Then you can add a file named `config` in the `~/.ssh/` directory that looks like

```
Host <some-friendly-name>
    IdentityFile <path-to-private-key>
    User <username-on-remote-server>
    HostName <public-DNS-or-IP-of-remote-server>
```

And now you can ssh into that server like:

```bash
ssh <some-friendly-name>
```