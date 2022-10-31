#!/bin/bash
if [ `uname` = 'Linux' ]; then
    curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi
