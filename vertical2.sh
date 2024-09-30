#!/bin/bash

# Directory containing your scripts
script_dir="/home/batan/check/"

# Select a script using fzf
selected_script=$(find "$script_dir" -type f | fzf)

# Check if a script was selected
if [[ -n "$selected_script" ]]; then
    # Get the total height of the screen
    total_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 2)

    # Calculate desired height range (20%-40%)
    desired_height_min=$((total_height * 20 / 100))
    desired_height_max=$((total_height * 40 / 100))

    # Randomly select a height within the desired range
    desired_height=$(shuf -i "$desired_height_min-$desired_height_max" -n 1)

    # Calculate y position for Row B
    y_position=$((total_height * 20 / 100))
    # Launch a terminal window with the selected script
    xfce4-terminal --geometry 80x${desired_height}+0+${y_position} -e "bash -c 'source \"$selected_script\"; exec bash'"
fi

