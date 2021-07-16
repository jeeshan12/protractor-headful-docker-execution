#!/bin/bash

# Startup Xvfb so an actually headless machine can pretend to have a display
Xvfb -ac :99 -screen 0 1280x1024x16 > /dev/null 2>&1 &

# Export some variables
export DISPLAY=:99.0

# Run commands
cmd=$@
echo "Running '$cmd'!"
if $cmd; then
    echo "Successfully ran '$cmd'"
else
    exit_code=$?
    echo "Failure running '$cmd', exited with $exit_code"
    exit $exit_code
fi

    npm run e2e --  --capabilities.chromeOptions.args="--no-sandbox" --capabilities.chromeOptions.args="--disable-dev-shm-usage" \
                --capabilities.chromeOptions.args="--disable-setuid-sandbox" \
                --capabilities.chromeOptions.args="--no-default-browser-check" \
                --capabilities.chromeOptions.args="--no-first-run" \
                --capabilities.chromeOptions.args="--disable-extensions"