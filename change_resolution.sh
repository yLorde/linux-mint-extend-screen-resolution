#!/bin/bash

PS3="Resolution: "
echo "Select the resolution"

xrandr help

select opt in "HDMI" "Integrated_Display" "Cancel"; do
	case $opt in
		"HDMI")
			xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
			xrandr --addmode HDMI-1 "1920x1080_60.00"
			xrandr --output HDMI-1 --mode "1920x1080_60.00"
			break
			;;
		"Integrated_Display")
			xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
			xrandr --addmode eDP-1 "1920x1080_60.00"
			xrandr --output eDP-1 --mode "1920x1080_60.00"
			break
			;;
		"Cancel")
			exit
			;;
		*) echo "Invalid choice $REPLY";;
	esac
done
