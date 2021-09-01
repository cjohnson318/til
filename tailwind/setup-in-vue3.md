# Setup Tailwind in Vue3

I had trouble installing Tailwind in a Vue3 project using this [guide](https://tailwindcss.com/docs/guides/vue-3-vite).
I tried installing Tailwind with:

```bash
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
```

But I ended up having to do this: 

```bash
npm install -D 'tailwindcss@npm:@tailwindcss/postcss7-compat' 'postcss@^7' 'autoprefixer@^9'
```

The rest worked out fine. I installed config files with:

```bash
npx tailwindcss init -p
```

This will create `tailwind.config.js` and `postcss.config.js` at the root.
Inside `tailwind.config.js`, I updated the `purge` attribute to:

```json
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'], // new
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
```

Then I created a root level `index.css` file.

```css
/* src/index.css */
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Then I imported `index.css` in `main.js`

```js
// src/main.js
import { createApp } from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'
import './index.css'

createApp(App).use(router).use(store).mount('#app')
```

Then, `npm run serve` should bring the project up on `localhost:8080`.