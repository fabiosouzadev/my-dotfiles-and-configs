#!/bin/sh

if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  if test ! $(which brew); then
    #Install Brew
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
	  brew update
	  brew doctor
  fi

  brew tap Homebrew/bundle
  brew bundle  
fi