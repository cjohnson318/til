# Relative Paths in `index.html`

Add a `vue.config.js` file to your project that sets the `publicPath` to `''`,
instead of the default, `'/'`.

```javascript
// vue.config.js

/**
 * @type {import('@vue/cli-service').ProjectOptions}
 */
module.exports = {
  publicPath: ''
}
```


## References

  - [Vue Configuration Reference](https://cli.vuejs.org/config/#vue-config-js)