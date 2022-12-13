#!/bin/bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y \
        && sudo apt-get update -y \
        && sudo apt-get install -y neovim
