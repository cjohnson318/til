# Execute a Command on a Running Container

Sometimes you need to execute a command in a container's runtime, but you don't
actually need to enter that container. The trick is to leave off the `-it`
argument you'd normally use to enter that container. 

```bash
docker exec <container-name> <command>
```

An example might be,

```bash
docker exec django python3 manage.py collectstatic --no-input
```

This is particularly useful whan executing commands remotely over SSH.

```bash
ssh -i ~./ssh/key user@hostname "docker exec django python3 manage.py collectstatic --no-input"
```

If you try to use `-it` in the command above, you get an error about TTY.