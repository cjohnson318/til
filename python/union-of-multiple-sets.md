# Union of Multiple Sets

If you have multiple lists, then you can take their collective union.

```python
green_things = ['apple', 'asparagus', 'pepper']
yellow_things = ['apple', 'banana', 'lemon', 'pepper']
red_things = ['apple', 'strawberry', 'pepper']

things = set().union(green_things, yellow_things, red_things)
>>> set(['apple', 'asparagus', 'pepper', 'banana', 'lemon', 'strawberry'])
```
