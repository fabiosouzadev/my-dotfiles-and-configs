#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl -sS https://webinstall.dev/k9s | sh
elif [ `uname` = 'Darwin' ]; then
    brew install derailed/k9s/k9s
fi
