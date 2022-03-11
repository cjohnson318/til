# Blue-Green Deployment

## Prerequisites

  - Two servers where you can move IP addresses between hosts.
  - On each server, have a non-root user with sudo priveliges.

## Big Idea

Pick a server to be the current production server. Set up the floating IP
address to direct production traffic to the production server. Now push new
changes to the other server and test. When you're happy with those changes,
then use the floating IP settings to direct production traffic to the updated
server.

## Pushing New Changes

Assuming you have `doctl` installed and configured,

```bash
docker build -t <container> .
docker tag <container>:latest registry.digitalocean.com/<repo>/<container>:latest
docker push registry.digitalocean.com/<repo>/<container>:latest
doctl apps create-deployment <app-id>
```

## Sticky Points

Database layer. To direct traffic from the test database to the production
database, we might be able to leverage environment variables provided to
containers.

Sure enough, we can update environment variables using `doctl` by saying,

```bash
doctl apps update <app-id> --spec <spec.yaml>
```

And then swap the floating IP over to the other server.

```bash
doctl compute floating-ip-action assign <floating-ip> <droplet-id> [flags]
```

## References

- [How To Use Blue-Green Deployments to Release Software Safely](https://www.digitalocean.com/community/tutorials/how-to-use-blue-green-deployments-to-release-software-safely)