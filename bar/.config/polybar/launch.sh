#!/bin/bash

# Terminate already running bad instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the example bar
polybar main-bar
