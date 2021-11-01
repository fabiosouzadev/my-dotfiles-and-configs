#!/bin/sh

# Install Zgenom
git clone https://github.com/jandamm/zgenom.git ~/zgenom


if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  stow --target=/Users/$USER zsh
else
  stow --target=/Users/$USER zsh
fi