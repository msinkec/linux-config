#!/bin/sh
# If you're running a display manager, make sure it runs this script. 
# For lightDM create a desktop entry inside /usr/share/xsessions/.

# If using optimus-manager without DM
if ! systemctl is-active --quiet display-manager.service; then
    if [[ -f "/usr/bin/prime-offload" ]]; then
        . /usr/bin/prime-offload
    fi
fi

# Set X keyboard layout
setxkbmap si &

# Restore background image, if it's set.
$HOME/.fehbg &

# Execute window manager
exec $WM

