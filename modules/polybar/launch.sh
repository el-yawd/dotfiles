#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar 2>/dev/null
sleep 0.5

# Launch polybar on each monitor
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
done
