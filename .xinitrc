#!/bin/sh
# If you're running a display manager, make sure it runs this script. 
# For lightDM create a desktop entry inside /usr/share/xsessions/.

# If using optimus-manager without DM
if ! systemctl is-active --quiet display-manager.service; then
    if [[ -f "/usr/bin/prime-offload" ]]; then
        . /usr/bin/prime-offload
    fi
fi

xset b off              # Disable beeping speaker
setxkbmap si &          # Set X keyboard layout
$HOME/.fehbg &          # Restore background image, if it's set
statbar &               # Script for updating the status bar
xbindkeys --poll-rc &   # Load X key binding
.screenlayout/default.layout.sh &         # Set my default X layout with xrandr
export SHELL="/usr/bin/zsh"               # Set default shell inside X session

# Start window manager
exec $WM

