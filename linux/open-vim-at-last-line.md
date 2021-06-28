# Open vim at the Last Line

I needed a script to open a vim editor at the last line. I used Python's
`subprocess.call` function to open vim at the last line with this command.

```bash
vim '+normal Go' /path/to/file.md
```

## Reference ##
[https://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html#the-answer](https://edunham.net/2015/01/29/vim_open_file_with_cursor_at_the_end.html#the-answer)