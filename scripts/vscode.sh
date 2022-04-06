# Install packages
VSCODE_EXTENSIONS=(

# ICONS
"vscode-icons-team.vscode-icons"
"PKief.material-icon-theme"
"helgardrichard.helium-icon-theme"

#THEMES
"enkia.tokyo-night"
"whizkydee.material-palenight-theme"
"mischah.relaxed-theme"
"arcticicestudio.nord-visual-studio-code"
"wart.ariake-dark"
"daltonmenezes.aura-theme"
"wicked-labs.wvsc-serendipity"
"morgan-codes.morgan-codes-vscode-theme"

#LINT
"dbaeumer.vscode-eslint"
"rohit-gohri.format-code-action"
"esbenp.prettier-vscode"
"editorconfig.editorconfig"
"oderwat.indent-rainbow"
"naumovs.color-highlight"
"sonarsource.sonarlint-vscode"
"hookyqr.beautify"


#GIT
"eamodio.gitlens"
"qezhu.gitlink"
"TeamHub.teamhub"
"vsls-contrib.gistfs"
"webyxco.vscode-gitandgithub-pack"

#Docker & Kubernetes
"ms-azuretools.vscode-docker"
"ms-kubernetes-tools.vscode-kubernetes-tools"

#Markdown
"davidanson.vscode-markdownlint"

#.ENV,.Yaml
"mikestead.dotenv"

#SCREENSHOT
"pnp.polacode"
"ericadamski.carbon-now-sh"
"adpyke.codesnap"

#AI
"tabnine.tabnine-vscode"
"GitHub.copilot"

#Debugger
"firefox-devtools.vscode-firefox-debug"

#OTHERS
"bierner.emojisense"
"MS-vsliveshare.vsliveshare-pack"
"Gruntfuggly.todo-tree"
"softwaredotcom.swdc-vscode"
"christian-kohler.path-intellisense"
"rbbit.typescript-hero"
"wakatime.vscode-wakatime"
"johnpapa.vscode-peacock"
"ms-vscode.sublime-keybindings"
"jpoissonnier.vscode-styled-components"
"lihui.vs-color-picker"
"hookyqr.minify"
"wayou.vscode-todo-highlight"
"wix.vscode-import-cost"
"vscodevim.vim"
"makerflow.makerflow"

)

for i in "${VSCODE_EXTENSIONS[@]}"
do
  code --install-extension  "$i"
done
