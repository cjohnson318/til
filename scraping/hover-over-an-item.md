# Hover Over an Item

This explains how to click on an item in a submenu that needs to be revealed
via a mouse hover, instead of a normal click.

Download and unzip the right version of the Chromium driver from
[here](https://sites.google.com/a/chromium.org/chromedriver/downloads)
and place it in your working directory.

```python
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains


driver = webdriver.Chrome(executable_path='./chromedriver')
url = ...
driver.get(url)

menu_xpath = '/html/body/root/sidebar/div/ul/li[1]'
menu = driver.find_element_by_xpath(menu_xpath)
hover = ActionChains(driver).move_to_element(menu)
hover.perform()
```

Then, if you're on a Mac, you can press `fn+F8` to freeze the submenu, and
inspect its elements in the developer console. Once you have the next xpath,
you can click on it,

```python
submenu_xpath = '/html/body/root/sidebar/div/ul/li[1]/sidebar-item/ul/li/ul/li[1]'
submenu = driver.find_element_by_xpath(submenu_xpath)
submenu.click()
```