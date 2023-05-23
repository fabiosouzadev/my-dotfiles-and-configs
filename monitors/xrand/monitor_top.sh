#!/bin/sh
xrandr --output eDP1 --mode 1366x768 --pos 597x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
feh --bg-fill --randomize $HOME/.config/wallpapers
