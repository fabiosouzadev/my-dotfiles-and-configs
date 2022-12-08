#!/bin/bash

# if [ ! -f ~/.local/bin/kitty ]; then
#   curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin installer=nightly launch=n 
#   ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
#   cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
#   cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
#   sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
#   sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
#   sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $HOME/.local/bin/kitty 1
#   sudo update-alternatives --set x-terminal-emulator $HOME/.local/bin/kitty
# fi

#Install alacritty
sudo rm -rv $HOME/.local/src/alacritty
git clone https://github.com/alacritty/alacritty.git $HOME/.local/src/alacritty
cd $HOME/.local/src/alacritty
rustup override set stable
rustup update stable
cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty


# Force support for only Wayland
#cargo build --release --no-default-features --features=wayland

# Force support for only X11
#cargo build --release --no-default-features --features=x11

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


sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 100
sudo update-alternatives --config x-terminal-emulator

sudo rm -r $HOME/.local/src/alacritty 
