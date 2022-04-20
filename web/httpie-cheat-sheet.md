# HTTPie Cheat Sheet

## Image Upload

Send an image.

```bash
http -f POST http://localhost:8000/api/load/image/ image@./image
```

The `-f` is short for `--form`, and the `image@` includes content type headers in the request, and sets the "name" attribute for the file.

[More examples](https://stackoverflow.com/questions/50830425/how-to-upload-a-file-with-put-in-httpie)