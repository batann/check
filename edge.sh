#!/bin/bash
#
xclip -selection clipboard -o >>t.txt
 /home/batan/.local/bin/edge-tts -v en-US-EmmaNeural -f t.txt --write-media output.mp3
 /usr/bin/mpv output.mp3

# mv output.mp3 ~/Music/output.$(date +%H.%M).mp3
/usr/bin/rm t.txt
/usr/bin/rm output.mp3
#read -n1 -p '  wait   >>>   ' bbb

