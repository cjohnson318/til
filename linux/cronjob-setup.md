# `cronjob` Setup

First install and "turn on" crontab.

```bash
sudo apt update
sudo apt install cron
sudo systemctl enable cron
crontab -e
```

Then choose an editor:

```bash
Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano
  2. /usr/bin/vim.basic  <--- most familiar
  3. /usr/bin/vim.tiny
  4. /bin/ed

Choose 1-4 [1]: 
```

I chose option 2 because I'm familiar with vim.

Then, to do something every hour:

```
0 * * * * python3 ~/path/to/script.py
```

## References

- [How To Use Cron to Automate Tasks on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804)