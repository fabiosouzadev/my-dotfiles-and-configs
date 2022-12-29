#!/usr/bin/env zsh 

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#Atualizar sources lists
sudo apt-get -y update

sudo apt-get install -y \
      ripgrep \
      universal-ctags \
      # fd-find \
      silversearcher-ag

#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd
