export PHPENV_ROOT="$HOME/.phpenv"
command -v phpenv >/dev/null || export PATH="$PHPENV_ROOT/bin:$PATH"
if command -v phpenv 1>/dev/null 2>&1; then 
  eval "$(phpenv init -)" 
fi
#
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
