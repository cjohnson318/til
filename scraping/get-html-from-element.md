# Get HTML from Element

You can access the html of an element so that you can process it further with
`lxml` by using the following idiom.

```python
from selenium import webdriver

driver = webdriver.Chrome(executable_path='./chromedriver')
url = ...
driver.get(url)

table_xpath = '/html/body/root/sidebar/div/table'
table_element = driver.find_element_by_xpath(table_xpath)
html = table_element.get_attribute('innerHTML')
# alternatively
html = table_element.get_attribute('outerHTML')
```