# Debug `permission denied while trying to connect to the Docker daemon socket`

I was trying to push data to AWS ECR, when I encountered this Docker related error message:

```
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.24/auth: dial unix /var/run/docker.sock: connect: permission denied
```

Workaround: run this, and retry:

```bash
sudo chmod 666 /var/run/docker.sock
```