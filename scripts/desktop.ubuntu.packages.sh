#!/bin/bash
sudo apt-get update

sudo apt-get install -y \
    snapd \
    slack

sudo snap install \
    authy \
    bitwarden \
    notion-snap \
    spotify

#Install brave