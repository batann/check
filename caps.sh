#!/bin/bash
xmodmap -e "clear lock"
xmodmap -e "remove Control = Control_L"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add Control = Control_L"
xcape -e "Control_L=Escape"
