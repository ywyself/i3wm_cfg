#!/bin/bash
# comment

# fcitx
fcitx &

# lauch clipbord
clipit &

# conky
start_conky_maia &

# polybar
$HOME/.config/polybar/launch.sh

# feh
$HOME/.config/feh/launch.sh
#nitrogen --restore
