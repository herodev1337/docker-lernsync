#!/bin/sh

set -e

if [ -z "$SYNC_INTERVAL_SECONDS" ] || [ "$SYNC_INTERVAL_SECONDS" -eq 0 ]; then
    exec /usr/bin/rclone "$@"
fi

while true; do
    /usr/bin/rclone "$@" > /dev/null
    if [ $?  -eq 9 ]; then
        echo "Copied nothing"
    fi
    sleep "$SYNC_INTERVAL_SECONDS"
done
