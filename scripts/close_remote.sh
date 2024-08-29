#!/bin/bash

# Set up SSH control path
CONTROL_PATH="~/.ssh/control_masters/%r@%h:%p"

# Close the SSH control channel
ssh -S "$CONTROL_PATH" -O exit proton23b

echo "SSH control channel closed."

