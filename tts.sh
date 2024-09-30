#!/bin/bash

# Capture yad output
yad_output=$(yad --borders=20 --image-on-top --image="/home/batan/100/icons/tts1.png" \
  --buttons-layout="spread" --form --title="Text-to-Speech Options" \
  --field="Voice":CB "en-US-AndrewMultilingualNeural! en-US-AndrewNeural! en-US-AriaNeural! en-US-AvaMultilingualNeural! en-US-AvaNeural! en-US-BrianMultilingualNeural! en-US-BrianNeural! en-US-ChristopherNeural! en-US-EmmaMultilingualNeural! en-US-EmmaNeural! en-US-EricNeural! en-US-GuyNeural! en-US-JennyNeural! en-US-MichelleNeural! en-US-RogerNeural! en-US-SteffanNeural" \
  --field="Pitch:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Volume:":SCL --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Rate:":RO --adjustment=-1 --integer --min-value=-100 --max-value=100 \
  --field="Text:" "" \
  --field="Media":RO "output" \
  --button="Cancel:1" --button="Speak!:0" --width=500 --height=300)
echo $yad_output
## Check if user canceled
#if [[ -z "$yad_output" ]]; then
#  exit 1
#fi
 Extract user selections
voice=$(echo "$yad_output" | awk -F '|' '{print $1}')
#pitch=$(echo "$yad_output" | awk -F '|' '{val=$2; if (val != 0) {printf("+%dHz", val)}; print val}')
#volume=$(echo "$yad_output" | awk -F '|' '{val=$3; if (val != 0) {printf("+%d%%", val)}; print val}')
#rate=$(echo "$yad_output" | awk -F '|' '{val=$4; if (val != 0) {printf("+%d%%", val)}; print val}')
text=$(echo "$yad_output" | awk -F '|' '{print $5}')
echo $yad_output
echo $text|sed 's/://g'>> temp.text.txt
## Build edge-tts command (improved readability)
edge_tts_cmd="/home/batan/.local/bin/edge-tts"
edge_tts_cmd+=" -v $voice"
##edge_tts_cmd+=" --pitch=${pitch}Hz"  # Add leading "+" for positive values
##edge_tts_cmd+=" --volume=${volume}%"  # Add leading "+" for positive values
##edge_tts_cmd+=" --rate=${rate}%"    # Add leading "+" for positive values
#edge_tts_cmd+=" -t \"$text\""
edge_tts_cmd+=" -f temp.text.txt"
edge_tts_cmd+=" --write-media output.wav"
#
## Execute edge-tts command
clear
echo "Executing: $edge_tts_cmd"
$edge_tts_cmd
mpv output.wav
rm temp.text.txt
rm output.wav
