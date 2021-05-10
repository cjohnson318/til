# Parse an HTML Table

What I've done in the past is locate an HTML table using an XPATH with Selenium
and then parse that HTML table using BeautifulSoup4. However, there's another
way: Pandas.

```python
import pandas
from selenium import webdriver

driver = webdriver.Chrome(executable_path='./chromedriver')
url = ...
driver.get(url)

table_xpath = '/html/body/root/sidebar/div/table'
table_element = driver.find_element_by_xpath(table_xpath)
html = table_element.get_attribute('innerHTML')
# alternatively
html = table_element.get_attribute('outerHTML')

# now you have a table as a DataFrame
table = pandas.read_html(html)
```