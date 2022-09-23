#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.15.0/kind-linux-amd64
    chmod +x -v ./kind
    sudo mv -v ./kind /usr/local/bin/kind
elif [ `uname` = 'Darwin' ]; then
    brew install kind
fi
