#!/bin/bash

#! /bin/sh
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c $HOME/.config/polybar/config.ini example
sleep 1
