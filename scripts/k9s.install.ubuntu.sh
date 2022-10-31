#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl -sS https://webinstall.dev/k9s | sh
fi
