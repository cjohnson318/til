# Set Style Globally

If you're following this [guide](https://tailwindcss.com/docs/guides/vue-3-vite)
(using Vue3) then you should have a css file located at `src/index.css`. Inside
that, you can define styles globally, and then still tweak elements locally
using class utilities.

```css
/* src/index.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

a {
    @apply text-green-500;
}
```
