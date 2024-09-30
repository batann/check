#!/bin/bash

# Directory containing your scripts
script_dir="/home/batan/check/"

# List scripts in the directory
scripts=$(ls "$script_dir")

# Use Rofi to select a script
selected_script=$(echo "$scripts" | rofi -dmenu -p "Select script:")

# Check if a script was selected
if [[ -n "$selected_script" ]]; then
    # Get the total height of the screen
    total_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 2)

    # Calculate desired height (20% of screen height)
    desired_height=$((total_height * 20 / 100))

    # Launch a terminal window with the selected script
    xfce4-terminal --geometry 80x${desired_height}+0+0 -e "bash -c 'cd \"$script_dir\" && ./\"$selected_script\"'"
fi

