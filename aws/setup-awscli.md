# Setup `awscli`

After installing `awscli` on your platform, you'll have a `~/.aws/` directory
in your home directory. Inside `~/.aws/` you'll have the following:

```
~/.aws/
├── config
└── credentials
```

The `config` file has region and output settings:

```
[default]
region = us-east-1
output = json
```

And the `credentials` contains credentials:

```
[default]
aws_access_key_id = ...
aws_secret_access_key = ...
```

To use another profile besides `default`, use another label in the square
brackets. Then, in `aws` commands, say `--profile <label>` to reference
settings associated with that profile.
