# Generate MIDI Music

## Prerequisite: Connect an Audio Device

To play MIDI music through Garage Band,

  1. Open the Audio MIDI Setup app
  2. Choose Window > Show MIDI Studio
  3. Double-click on IAC Driver
  4. Check Device is online
  5. Start Garage Band and add a software MIDI track
  6. Test that it's working with your keyboard

Most `pygame` and/or MIDI guides assume you know how to do this part.

## Generate Music

I modified this script from [here](https://pythonprogramming.altervista.org/a-midi-synth-in-pygame/?doing_wp_cron=1638809090.8745620250701904296875)
to play a jazz 6-2-5-1 turnaround, using standard positions.

```python
import pygame
import pygame.midi
from time import sleep
import sys
 
C = 74
MAX = 127
brief = .5
 
def midi(notes, volume=MAX, length=brief):
    for note in notes:
        midi_out.note_on(note, volume) # 74 is middle C, 127 is "how loud" - max is 127
    sleep(brief)
    for note in notes: 
        midi_out.note_off(n, volume)
    sleep(brief)
 
# init
GRAND_PIANO = 0
CHURCH_ORGAN = 19
instrument = GRAND_PIANO
pygame.init()
pygame.midi.init()
port = pygame.midi.get_default_output_id()
midi_out = pygame.midi.Output(port, 0)
midi_out.set_instrument(instrument)
print ("using output_id :%s:" % port)
 
def exit():
    global midi_out, music
 
    music = 0
    del midi_out
    pygame.midi.quit()
    pygame.quit()
    sys.exit()

Amin7 = [81, 84, 88, 91]
Dmin7 = [74, 77, 81, 84]
Gdom7 = [79, 83, 86, 89]
Cmaj7 = [72, 76, 79, 83]
progression = [Amin7, Dmin7, Gdom7, Cmaj7]

screen = pygame.display.set_mode((400, 400))
music = True
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                exit()
    if music:
        for chord in progression:
            midi(chord)
```

## Reference

- [SO: Outputting MIDI sound from Python Mido library on Mac](https://stackoverflow.com/questions/40498625/outputting-midi-sound-from-python-mido-library-on-mac)
- [A midi synth in Pygame](https://pythonprogramming.altervista.org/a-midi-synth-in-pygame/?doing_wp_cron=1638809090.8745620250701904296875)