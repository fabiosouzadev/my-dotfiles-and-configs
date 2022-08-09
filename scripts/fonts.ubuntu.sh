#!/bin/bash

TEMP_DIR_FONTS=$HOME/.temp-fonts
LOCAL_SHARE_FONTS=$HOME/.local/share/fonts

FONTS=(
"CascadiaCode"
"FiraCode"
"Hack"
"Iosevka"
"JetBrainsMono"
"VictorMono" 
)


if [ ! -d $LOCAL_SHARE_FONTS ]; then
    mkdir  $LOCAL_SHARE_FONTS
fi


if [ ! -d $TEMP_DIR_FONTS ]; then
    mkdir  $TEMP_DIR_FONTS
    cd $TEMP_DIR_FONTS
fi



for i in "${FONTS[@]}"
do
    ### sudo ./install.sh <Font-Name>
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/"$i".zip"
    unzip "$i".zip
done

cp -v *.ttf  $LOCAL_SHARE_FONTS
fc-cache -fv
sudo rm -r $TEMP_DIR_FONTS