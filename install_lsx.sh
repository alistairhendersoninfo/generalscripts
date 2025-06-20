#!/bin/sh
# Install lsx script to /usr/local/bin or specified directory

DEST=${1:-/usr/local/bin}

if [ ! -d "$DEST" ]; then
    echo "Creating directory $DEST"
    mkdir -p "$DEST" || exit 1
fi

install -m 0755 "$(dirname "$0")/lsx" "$DEST/lsx" && echo "Installed lsx to $DEST/lsx"
