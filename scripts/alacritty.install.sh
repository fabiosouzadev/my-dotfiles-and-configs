#!/bin/bash

if [ ! -f /usr/local/bin/alacritty ]; then
    #Install alacritty
    git clone https://github.com/alacritty/alacritty.git $HOME/.local/src/alacritty
    cd $HOME/.local/src/alacritty
    rustup override set stable
    rustup update stable
    cargo build --release    
    ### Force support for only Wayland ###
    #cargo build --release --no-default-features --features=wayland
    
    ### Force support for only X11 ###
    #cargo build --release --no-default-features --features=x11

    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    infocmp alacritty

    # Desktop Icon
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    #Install man page
    sudo mkdir -p /usr/local/share/man/man1
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

    #configs
    mkdir $HOME/.config/alacritty

    # Themes ???????
    npm i -g alacritty-themes
    
    #completions 011-alacritty.zsh
    #cp -vvv extra/completions/_alacritty ~/.zshrc.d/011-alacritty.zsh

    # Default terminal
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 100
    sudo update-alternatives --config x-terminal-emulator

    sudo rm -r $HOME/.local/src/alacritty 
fi
