# Authorization Token Gotcha

I was working with `dj-rest-auth`. After logging in, I got a token back. I
tried to access the `/dj-rest-auth/user/` endpoint as:

```python
import requests

url = "http://0.0.0.0:8000/dj-rest-auth/user/"
headers = {
    "Authorization": "DEADBEEF0DEADBEEF0DEADBEEF",
}
resp = requests.post(url, headers=headers)
```

This did not work. Eventually I figured out that the token needed to have
**`Token`** at the beginning. This ended up working:

```python
import requests

url = "http://0.0.0.0:8000/dj-rest-auth/user/"
headers = {
    "Authorization": "Token DEADBEEF0DEADBEEF0DEADBEEF",
}
resp = requests.post(url, headers=headers)
```