# Example: Cheerio

Use this to scrape/parse HTML. This example pulls the titles from HackerNews,
and then prints the headlines out using `console.table()`.

First, setup a node project and install dependencies:

```bash
npm init
npm install axios cheerio
```

Then update your package.json to include the following:

```json
{
  ...
  "scripts": {
    "start": "node index.js",
    "dev": "nodemon index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  ...
}
```

Here is what I have in `index.js`.

```js
const axios = require('axios')
const cheerio = require('cheerio')

const scrapingTarget = 'https://news.ycombinator.com/'
const path = '#hnmain > tbody > tr:nth-child(3) > td > table > tbody'

let data = []

axios.get(scrapingTarget)
  .then(res => {
    const $ = cheerio.load(res.data)
    $(path).find('tr.athing').each((index, element) => {

      const headline = $(element).text().split('      ')
      const title = headline[2].trim()

      data.push({title: title})
    })
    console.table(data)
  })
```

Then start up your script for iterative development using:

```bash
npm run dev
```

This way, `nodemon` re-runs everything every time you save something.

## Reference

  - [Web Scraping using axios and Cheerio](https://dev.to/drsimplegraffiti/i-scraped-dev-to-using-axios-and-cheerio-26ko)