#!/bin/bash

if [ ! -f /etc/vim/vimrc.local ]; then
    sudo touch /etc/vim/vimrc.local
fi

sudo bash -c 'cat <<EOL >> /etc/vim/vimrc.local
set number
set noswapfile
set nobackup
set nowritebackup
set viminfo=

if empty(glob("/etc/vim/autoload/plug.vim"))
    silent !curl -fLo /etc/vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin("/etc/vim/plugged")
Plug '"'"'preservim/nerdcommenter'"'"'
call plug#end()

let mapleader = ","
let g:NERDSpaceDelims = 1
EOL'

sudo vim +PlugInstall +qall

echo "Einstellungen wurden erfolgreich angewendet. Das Nerdcommenter-Plugin wurde für alle Benutzer installiert und aktiviert."
