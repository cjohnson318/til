# Enter a Running Container

This usually works on containers that have `/bin/bash` installed, otherwise try
`sh`. You can find the container name by running `docker ps` or you can check
your `docker-compose.yaml` file, if you have one, and if you set container
names there.

```bash
docker exec -it <container-name> /bin/bash
```