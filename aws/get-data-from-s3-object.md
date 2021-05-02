# Get Data from an S3 Object

I use this code to check if an object (1) has any data at all, and (2) check if
it has any data in its `Body` attribute.

```python
class EmptyObjectError(Exception): pass

class EmptyBodyError(Exception): pass

def get_data_from_s3_object(obj):
    '''Get data out of S3 object.

    Args:
        s3 (object): S3 resource object
        bucket (str): name of bucket
        key (str): name of object in bucket

    Raises:
        EmptyObjectError
        EmptyBodyError

    Returns:
        data: binary, use with pandas.[read_excel|read_csv]
    '''
    obj_container = obj.get()
    if obj_container is None:
        raise EmptyObjectError('Object is empty')
    data = obj_container.get('Body')
    if data is None:
        raise EmptyBodyError('Object Body attribute is empty.')
    return data
```

Then I can specify a bucket, iterate through each item of that bucket, read
each item as binary data, and do something, like process that data in chunks
using pandas.

```python
import boto3

s3_resource = boto3.resource('s3')
bucket = s3_resource.Bucket('some-bucket')

for obj in bucket.objects.all():
    data = get_data_from_s3_object(obj)
    for chunk in pandas.read_csv(data, chunksize=10_000):
        ...
```