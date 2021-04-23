# Access a Container Running in ECS

First, SSH into the EC2 associated with the cluster and task in ECS that you're
interested in. Here, `<key.pem>` is the SSH key associated with your account,
and `<public-IPv4-DNS>` is a URL that is found in the EC2 console. Each EC2
will have its own public IPv4 IP address and DNS.

```bash
ssh -i ~/.ssh/<key.pem> ec2-user@<public-IPv4-DNS>
```

Then list containers running in that EC2 instance.

```bash
docker container list
```

Then use the Container ID to access the shell of the container you are
interested in.

```bash
docker exec -it <container-ID> /bin/bash
```

Then you can perform migrations, or do whatever you need to do.