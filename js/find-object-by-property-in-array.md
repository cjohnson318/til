# Find an Object by Property in an Array

Say you want to find an object in an array based on a (unique) property.
The `.includes(...)` array method will not work in this case.
Instead, use the `.find(...)` array method.
This will return the first match, or `undefined` if no match is found.

```js
const objects = [
    {
        fruit: 'banana',
        count: 3,
    },
    {
        fruit: 'apple',
        count: 5,
    },
]
let result = objects.find(item => item.fruit === 'banana')
console.log(result) // {fruit: 'banana', count: 3}
```