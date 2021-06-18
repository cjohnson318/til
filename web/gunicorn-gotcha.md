# Gunicorn Gotcha

I was working on a Django application locally, with a Python virtual
environment. I accidentally installed gunicorn with pip globally, outside of
the virtual environment. Thinking nothing of it, I re-entered the virtual
environment, installed gunicorn locally in that environment, and then tried to
start the gunicorn server.

```bash
gunicorn --bind 0.0.0.0:8000 project.wsgi
```

However, calling gunicorn at the terminal referenced the global gunicorn, not
the one in the virtual environment. After a while, I finally called
`which gunicorn` and realized my error.

I exited the Python virtual environment, called `pip uninstall gunicorn` and
then everything worked normally.