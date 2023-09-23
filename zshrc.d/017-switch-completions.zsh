echo 'source <(switcher init zsh)' >> ~/.zshrc

# optionally use alias `s` instead of `switch`
echo 'source <(alias s=switch)' >> ~/.zshrc
echo 'source <(compdef _switcher switch)' >> ~/.zshrc
