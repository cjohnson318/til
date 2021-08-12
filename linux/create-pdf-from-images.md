# Create a PDF from images

First, install `imagemagick`

```bash
brew install imagemagick
```

Jump through random hoops to complete install.

Use splat operator to collect images and convert them to a PDF.

```bash
convert ~/pictures/*.jpeg ~/documents/output.pdf
```
