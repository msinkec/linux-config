#!/bin/sh

echo "test"

# Define WM to use
export WM="dwm"

# If WM is not already running, start X-server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x $WM > /dev/null && exec startx

