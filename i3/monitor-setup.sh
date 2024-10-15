#!/bin/bash

# Setup monitors
if xrandr | grep "HDMI-2 connected"; then
    xrandr --output HDMI-2 --mode 1920x1080 --rate 119.98 --right-of eDP-1
    
    # Wait for the display to be properly set up
    sleep 2
    
    # Move workspaces 6-10 to the second monitor
    for i in {6..10}; do
        i3-msg "workspace $i; move workspace to output HDMI-2"
    done
else
    xrandr --output HDMI-2 --off
    
    # Move workspaces back to the primary monitor if HDMI-2 is disconnected
    for i in {6..10}; do
        i3-msg "workspace $i; move workspace to output eDP-1"
    done
fi

# Restart polybar
pkill polybar
polybar &

# Wait a moment to ensure polybar has time to start
sleep 1
