#!/bin/bash
if [[ `uname` == 'Linux'  ]]; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
elif [ `uname` = 'Darwin' ]; then
    brew install minikube
fi
