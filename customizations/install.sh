#!/bin/sh

# Install Zgenom
git clone https://github.com/jandamm/zgenom.git ~/zgenom


if [ $(uname -a | grep -ci Darwin) = 1 ]; then
  stow --target=/Users/$USER zsh
  echo "\nexport RUST_BACKTRACE=1" | tee -a ~/.zshrc
else
  stow --target=/Users/$USER zsh
fi

if [ -f .env ]; then
  eval $(cat .env | sed 's/^/export /')
else
  echo "You need to write a .env file. Use example.env to create yours"
  exit 1
fi

echo $GIT_NAME
echo $GIT_EMAIL

GITCONFIG_FILE="${HOME}/.gitconfig"
GITCONFIG_CONF="[user]
	name  = $GIT_NAME
	email = $GIT_EMAIL"

echo "${GITCONFIG_CONF}" | tee -a "${GITCONFIG_FILE}"
