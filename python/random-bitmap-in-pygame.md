# Random Bitmap in PyGame

This produces a random black and white bitmap in using PyGame, and then saves
the resulting image as a jpeg on closing the window.

```python
import random
import sys

import pygame

BLACK = (0,0,0)


def args() -> (int, int, int):
    '''Return width, height, cell_size.
    '''
    if len(sys.argv) <= 1:
        width, height, cell_size = 300, 300, 10
    else:
        width = int(sys.argv[1])
        height = int(sys.argv[2])
        cell_size = int(sys.argv[3])
    return width, height, cell_size


def draw(window, cell_size):
    '''Draw a very poor QR code, or impossible crossword.
    '''
    width = window.get_width()
    height = window.get_height()
    for i in range(width // cell_size):
        for j in range(height // cell_size):
            rnd = random.uniform(0,1)
            if rnd > 0.5:
                x = i * cell_size
                y = j * cell_size
                pygame.draw.rect(window, BLACK, (x, y, cell_size, cell_size))
    

def main():
    width, height, cell_size = args()
    pygame.init()
    window = pygame.display.set_mode((width, height))
    window.fill((255, 255, 255))
    
    draw(window, cell_size)
    pygame.display.flip()

    run = True
    while run:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False

    pygame.image.save(window, "screenshot.jpeg")
    pygame.quit()


if __name__ == '__main__':
    main()
```