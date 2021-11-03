#!/bin/sh

ZSHRC="${HOME}/.zshrc"
mkdir -p $HOME/.config && touch $HOME/.config/starship.toml

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo '\neval "$(starship init zsh)"' | tee -a "${ZSHRC}"