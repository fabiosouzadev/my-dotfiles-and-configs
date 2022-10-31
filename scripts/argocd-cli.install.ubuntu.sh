#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo install -vm 555 argocd-linux-amd64 /usr/local/bin/argocd
    rm -v argocd-linux-amd64
fi
