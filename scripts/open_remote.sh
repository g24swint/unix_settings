#!/bin/bash

# Set up SSH control path
CONTROL_PATH="~/.ssh/control_masters/%r@%h:%p"

# Open SSH control channel in the background with port forwarding
# ssh -M -S "$CONTROL_PATH" -fnNT -L 9944:localhost:9944 -L 64739:localhost:33033 proton23b
ssh -fnNT proton23b

echo "SSH control channel opened with port forwarding."

