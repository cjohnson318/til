# Include Environment Variables

To include environment variables, a la carte, when running a Docker container,

```bash
docker run -d -e VARIABLE_NAME='variable-value' <container-name>
```

To use an environment file, `.env`,

```bash
docker run -d --env-file ./.env <container-name> 
```