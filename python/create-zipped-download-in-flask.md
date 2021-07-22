# Create Zipped Download in Flask

The plan is to:

  1. Create a stream of bytes using `io`
  2. Write in-memory data that byte stream using `zipfile`
  3. Return that data to a user using `flask.send_file()`

I'll assume you have a small Flask server up and running already.

```python
from flask import request, send_file, Flask

application = Flask(__name__)
application.debug = False

def some_data(n):
    data = 'X,Y,Z\n'
    for i in range(n):
        data += f'{random.random()},{random.random()},{random.random()}\n'
    return data

@application.route('/some/report', methods=['GET', 'POST'])
def some_report():
    if request.method == 'GET':
        data = some_data(10_000)
        memory_file = io.BytesIO()
        with zipfile.ZipFile(memory_file, mode='w', compression=zipfile.ZIP_DEFLATED) as zf:
            zf.writestr(filename, data)
        memory_file.seek(0)
        return send_file(
            memory_file,
            mimetype = 'zip',
            attachment_filename='some-report.csv.zip',
            as_attachment=True,
        )
    elif request.method == 'POST':
        return 'wv report got POST'
```

