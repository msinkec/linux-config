#!/bin/sh

# Define WM to use
export WM="dwm"

# Add ~/.local/scripts/ to PATH
if [ -d "$HOME/.local/scripts" ] ; then
    PATH="$HOME/.local/scripts:$PATH"
fi

# If WM is not already running, start X-server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x $WM > /dev/null && exec startx

