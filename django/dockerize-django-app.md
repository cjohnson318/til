# Dockerize Django App

This is my base Dockerfile for running a Django application. This assumes that
the Django project and all of its apps sit inside `src/`, and that the
Dockerfile sits beside `src/`.

```dockerfile
# Pull base image
FROM python:3.9.1

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Update packages
RUN apt update -y && apt upgrade -y 

# Set working directory
WORKDIR /usr/src/app

# Copy project
COPY src /usr/src/app

# Install dependencies
RUN pip install -r requirements.txt

# Start the web server
CMD gunicorn --bind 0.0.0.0:8000 --workers 1 --timeout 90 --worker-class gevent config.wsgi:application
```

The minimum requirements are `django`, `gunicorn`, and `gevent`.

```bash
source venv/bin/activate
python3 -m pip install django gunicorn gevent
python3 -m pip freeze > src/requirements.txt
```

Then we can build and run this with,

```bash
docker build -t <name> .
docker run -d -p 8000:8000 <name>
```