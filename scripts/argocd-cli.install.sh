#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
    rm argocd-linux-amd64
elif [ `uname` = 'Darwin' ]; then
    brew install argocd
fi
