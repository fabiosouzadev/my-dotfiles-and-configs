#!/bin/bash
# Install packages
VSCODE_EXTENSIONS=(
# ICONS 
'vscode-icons-team.vscode-icons'
#THEMES
"enkia.tokyo-night"
"whizkydee.material-palenight-theme"
"arcticicestudio.nord-visual-studio-code"
"daltonmenezes.aura-theme"
"wicked-labs.wvsc-serendipity"
"johnpapa.vscode-peacock"

)

for i in "${VSCODE_EXTENSIONS[@]}"
do
  $1 --install-extension  "$i"
done
