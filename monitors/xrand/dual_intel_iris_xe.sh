#!/bin/sh
xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 2560x1080x49.94 --pos 1920x0 --rotate normal
feh --bg-fill --randomize $HOME/.config/wallpapers
