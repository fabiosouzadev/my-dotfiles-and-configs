#!/bin/bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y \
        && apt-get update -y \
        && apt-get install -y neovim
