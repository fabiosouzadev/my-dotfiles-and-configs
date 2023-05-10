export PATH="$PATH:$HOME/.asdf/bin"
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
export FLUTTER_ROOT="$(asdf where flutter)"