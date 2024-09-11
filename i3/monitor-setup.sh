#!/bin/bash

# Setup monitors
if xrandr | grep "HDMI-2 connected"; then
    xrandr --output HDMI-2 --mode 1920x1080 --right-of eDP-1
else
    xrandr --output HDMI-2 --off
fi

# Restart polybar
pkill polybar
polybar &

# Wait a moment to ensure polybar has time to start
sleep 1
