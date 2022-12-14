#!/usr/bin/env zsh 

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#Atualizar sources lists
sudo apt-get -y update

sudo apt-get install -y \
      ripgrep \
      universal-ctags \
      silversearcher-ag \
      fd-find

#Config fd
sudo ln -fvs /usr/bin/fdfind /usr/bin/fd
