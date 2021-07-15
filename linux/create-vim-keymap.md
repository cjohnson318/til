# Create a Key Mapping in Vim

I mapped my F1 key to write the current date in `YYYY-MM-DD` format, when I was
in insert mode in Vim. To do this, I added the following line to my `.vimrc`
file.

```
" insert datetime YYYY-MM-DD
imap <F1> <C-R>=strftime('%F')<CR>
```