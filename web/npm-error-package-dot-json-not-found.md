# NPM Error - Cannot find module `../package.json`

This is the error I saw:

```
npm run serve

> frontend@0.1.0 serve
> vue-cli-service serve

node:internal/modules/cjs/loader:936
  throw err;
  ^

Error: Cannot find module '../package.json'
Require stack:
- /Users/connor/projects/.../frontend/node_modules/.bin/vue-cli-service
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:933:15)
    at Function.Module._load (node:internal/modules/cjs/loader:778:27)
    at Module.require (node:internal/modules/cjs/loader:999:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at Object.<anonymous> (/Users/connor/projects/.../frontend/node_modules/.bin/vue-cli-service:4:25)
    at Module._compile (node:internal/modules/cjs/loader:1099:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:975:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:77:12) {
  code: 'MODULE_NOT_FOUND',
  requireStack: [
    '/Users/connor/projects/.../frontend/node_modules/.bin/vue-cli-service'
  ]
}

Node.js v17.7.1
```

The solution was to run the following:

```bash
rm -r node_modules
npm install
```                                                                