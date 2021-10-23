# DNS Gotcha

I was trying to add `CNAME`s to Google DNS for SendGrid, but SendGrid was
unable to verify that the `CNAME`s were present on the DNS. Turns out,
you need to strip your host name off of the `CNAME` keys that SendGrid gives
you.

## Reference

  - [How to add CNAME records to Google Domain?](https://stackoverflow.com/questions/62526994/how-to-add-cname-records-to-google-domain)