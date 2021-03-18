# Run Lambda Containers Locally

Assume we have a Lambda function named `myfunction`. Then we can build an image:

```bash
docker build -t myfunction .
```

Then we can run it locally:

```bash
docker run -p 9000:8080  myfunction:latest
```

Then we can trigger that function with curl:

```bash
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

[Official Documentation](https://docs.aws.amazon.com/lambda/latest/dg/images-test.html)
