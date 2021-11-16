#!/bin/sh

if test -L $HOME/.vimrc || test -f $HOME/.vimrc; then
	rm $HOME/.vimrc
fi


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# To Vim visual multi 
mkdir -p ~/.vim/pack/plugins/start && \
    git clone https://github.com/mg979/vim-visual-multi ~/.vim/pack/plugins/start/vim-visual-multi


cp .vimrc  $HOME
