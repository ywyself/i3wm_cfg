#!/usr/bin/env bash

echo "wallpaper set"

# Terminate already running bar instances
#killall -q feh

# Wait until the processes have been shut down
#while pgrep -u $UID -x feh >/dev/null; do sleep 1; done

# setting wallpaper
feh --bg-scale $HOME'/.config/feh/wallpaper/wallpaper.png'

echo "done"
