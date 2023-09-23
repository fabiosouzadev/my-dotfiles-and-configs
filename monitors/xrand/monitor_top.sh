#!/bin/sh
xrandr --output eDP-1 --mode 1366x768 --pos 597x1080 --rotate normal --output DP-1 --off --output DP-2 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output VIRTUAL-1 --off && \
feh --bg-fill --randomize $HOME/.config/wallpapers
