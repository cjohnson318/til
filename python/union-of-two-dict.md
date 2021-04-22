# Union of Two Dict

I never can think of the name of this, I want to call it union, or merge, but
it's update.

```python
name_street = {
    'first_name': 'JOHN',
    'last_name': 'DOE',
    'street': '123 CAMP ST',
}
city_state = {
    'city': 'NEW ORLEANS',
    'state': 'LA',
}
address = name_street.update(city_state)
```