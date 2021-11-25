#!/bin/sh

STARSHIP_ZSHRC_FILE=$HOME/.zshrc.d/04-starship.zsh
mkdir -p $HOME/.config && touch $HOME/.config/starship.toml

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo 'eval "$(starship init zsh)"' | tee  "${STARSHIP_ZSHRC_FILE}"