# Expose Foreign Key Fields in Serializer

If you have a database model that is composed from other foreign keys, and you
want those relationships to be transparent to an API consumer, you can expose
fields from those foreign keys on the endpoint that references them.

For example, suppose you have a library app, and a serializer for the book of
the month model that holds the month as a string, and a foreign key to the
book of the month.

```python
from rest_framework import serializers

from library.models import (
    BookOfTheMonth,
)

class BookOfTheMonthSerializer(serializers.ModelSerializer):

    book_name = serializers.CharField(source='book.name', read_only=True)

    class Meta:
        model = BookOfTheMonth
        fields = (
            'id',
            'book',
            'book_name',
            'month',
        )
```

This endpoint returns a JSON that has fields for the id of the book of the
month object, the id of that book, the name of the book, taken from the Book
object, through the foreign key reference, and the month, as a string.