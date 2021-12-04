# Deploy Django to Heroku

## Django-Heroku module

Install a module to simplify Django deployment to Heroku.

```bash
pip install django-heroku
pip freeze > requirements.txt
```

Add to this to the **very** end of `settings.py`

```python
# Configure Django App for Heroku.
import django_heroku
django_heroku.settings(locals())
```


## ENV

Move environment variable from your `.env` file to the Heroku dashboard, under
**App Name** > **Settings**.


## PostgreSQL

Configure environment for Postgres

```bash
pip install psycopg2
pip freeze > requirements.txt
```

Change the `DATABASES` dict in `settings.py` to,

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # new
    }
}
```


## `requirements.txt`

Move `requirements.txt` to the root directory.


## `Procfile`

Add a `Procfile` with migrate, and runserver. I don't endorse adding a migrate
step to an automated process like this, but you can remove it and re-deploy.

```
release: python src/manage.py migrate
web: python src/manage.py runserver 0.0.0.0:$PORT
```


## Command Line Interface

```bash
brew install heroku
heroku login
git init
git add .
git commit -m 'Initial commit'
heroku git:remote -a <app-name>
heroku buildpacks:set heroku/python
git push heroku <app-name>:master
```