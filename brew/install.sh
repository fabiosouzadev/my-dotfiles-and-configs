#!/bin/sh
system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then

  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    #Install Brew
    xcode-select --install
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew doctor
  fi

  if [ ! -f "$HOME/.Brewfile" ]; then
    ln -s ./Brewfile $HOME/.Brewfile
  fi
    
  echo "Updating homebrew bundle"
  export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
  brew bundle install 

fi
