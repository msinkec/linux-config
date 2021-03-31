#!/bin/sh

# Everything you write here will be executed by the display manager when setting up the login screen in Nvidia mode.
# (but before optimus-manager sets up PRIME with xrandr commands).

# Tearfree
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
