#!/bin/sh

# Define WM to use
export WM="dwm"

# Add ./locan/bin to PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# If WM is not already running, start X-server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x $WM > /dev/null && exec startx

