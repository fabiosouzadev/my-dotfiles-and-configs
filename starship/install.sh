#!/bin/sh


ZSHRC="${HOME}/.zshrc"
mkdir -p $HOME/.config && touch $HOME/.config/starship.toml

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo 'eval "$(starship init zsh)"' | tee -a "${ZSHRC}"