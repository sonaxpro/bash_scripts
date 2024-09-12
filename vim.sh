#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Überprüfen, ob die Datei .vimrc existiert
vimrc_content="set number
set noswapfile
set nobackup
set nowritebackup
set viminfo=

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'

call plug#end()

\" nerdcommenter
let mapleader = \",\"
let g:NERDSpaceDelims = 1"

if [ -f ~/.vimrc ]; then
    cat ~/.vimrc
    echo $Teiler
    echo "Die Datei ~/.vimrc existiert bereits. Möchten Sie sie durch den Standard von Sonax ersetzen? (j/n/z)"
    read -p "j/n/z: " choice
    case "$choice" in
        j)
            echo "$vimrc_content" > ~/.vimrc
            echo "Die Datei ~/.vimrc wurde durch den Standardinhalt ersetzt."
            ;;
        n)
            echo "Die Datei ~/.vimrc bleibt unverändert."
            ;;
        z)
            echo $Teiler
            echo "$vimrc_content"
            read -p "Möchten Sie die Datei jetzt ersetzen? (j/n) " choice_after_show
            case "$choice_after_show" in
                j)
                    echo "$vimrc_content" > ~/.vimrc
                    echo "Die Datei ~/.vimrc wurde durch den Standardinhalt ersetzt."
                    ;;
                n)
                    echo "Die Datei ~/.vimrc bleibt unverändert."
                    ;;
                *)
                    echo "Ungültige Eingabe. Die Datei ~/.vimrc bleibt unverändert."
                    ;;
            esac
            ;;
        *)
            echo "Ungültige Eingabe. Die Datei ~/.vimrc bleibt unverändert."
            ;;
    esac
else
    echo "$vimrc_content" > ~/.vimrc
    echo "Die Datei ~/.vimrc wurde erstellt und mit dem Standardinhalt gefüllt."
    cat ~/.vimrc
fi

# Vim-Plug Installation und Source-Befehl ausführen
vim +PlugInstall +qall
vim +source ~/.vimrc +qall
