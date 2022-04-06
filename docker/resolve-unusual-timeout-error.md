# Resolve Unusual Timeout Error

I saw something along the lines of this:

```
ERROR: for project_nginx_1  UnixHTTPConnectionPool(host='localhost', port=None): Read timed out. (read timeout=60)
```

Per the error message, I tried increasing the default timeouts as,

```bash
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120
```

But that didn't work.

## Resolution

Shut down the Docker client on the OS, and start it back up again.