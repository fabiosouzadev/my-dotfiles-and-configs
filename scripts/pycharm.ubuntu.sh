#!/bin/sh

SHORTCUTS_DIR="/usr/share/applications"

PYCHARM_SHORTCUT="[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community-2022.2/bin/pycharm.svg
Exec=\"/opt/pycharm-community-2022.2/bin/pycharm.sh\" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
StartupNotify=true"


wget -v -P $HOME https://download.jetbrains.com/python/pycharm-community-2022.2.tar.gz
sudo tar xzf $HOME/pycharm-community-2022.2.tar.gz -C /opt/
rm $HOME/pycharm-community-2022.2.tar.gz
cd /opt/pycharm-community-2022.2/bin

#PYCHARM_ATALHO
echo "${PYCHARM_SHORTCUT}"  | sudo tee "${SHORTCUTS_DIR}/jetbrains-pycharm.desktop"	

sh pycharm.sh
