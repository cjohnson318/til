# Change the Endian-ness of a File

If you just need to change the endian-ness of INT16 or UINT16 data then you can use the `dd` utility on Mac or Linux:

```bash
dd if=original.txt of=swapped.txt conv=swab
```

The `conv=swab` part means "use the conversion SWAp Bytes".

Then you can check the results with the `xxd` utility:

```bash
xxd original.txt
xxd swapped.txt
```