#!/bin/bash
clear
Teiler="######################################################"
echo $Teiler
echo "## Sonax Einstellungen v0.01 von 12.07.2024"
echo $Teiler

# 1. .bash_profile zu erstellen

# Definieren des Standardinhalts
standard_content="alias l='ls -lahp --group-directories-first --color=auto --time-style=\"+%b %e %Y %H:%M\"'
alias la='ls -lhp --group-directories-first --color=auto --time-style=\"+%b %e %Y %H:%M\"'
alias c='clear'
alias cl='clear; l'
alias cla='clear; la'
alias r='rm -rf '
alias a='vim ~/.bash_profile'
alias cu='curl -I'
alias urc='source ~/.bash_profile'
alias du='du -h | sort -h'
alias gst='git status'
alias ga='git add . ; git status'
alias gb='git branch'
alias gc='git commit -m'
alias gp='git push origin master'

# TERMUX
#alias m='cd ~/All-In-One-main'
#alias mcp='cp /storage/emulated/0/All-In-One-main/sessions/* ~/All-In-One-main/sessions/ ; r /storage/emulated/0/All-In-One-main/sessions/*'
#alias ms='cd ~/All-In-One-main; python ~/All-In-One-main/multi-account.py'
#alias mc='vim ~/All-In-One-main/config.json'

# Manitu
#alias p='cd /home/sites/site100037231/web/gahlnbaeck.de'
#alias pp='cd /home/sites/site100037231/web/gahlnbaeck.de/public'"

# Überprüfen, ob die Datei .bash_profile existiert
if [ -f ~/.bash_profile ]; then
    cat ~/.bash_profile
    echo $Teiler
    echo "Die Datei ~/.bash_profile existiert bereits. Möchten Sie sie durch den Standard von Sonax ersetzen? (j/n/z)"
    read -p "j/n/z: " choice
    case "$choice" in
        j)
            echo "$standard_content" > ~/.bash_profile
            echo "Die Datei ~/.bash_profile wurde durch den Standardinhalt ersetzt."
            ;;
        n)
            echo "Die Datei ~/.bash_profile bleibt unverändert."
            ;;
        z)
            echo $Teiler
            echo "$standard_content"
            read -p "Möchten Sie die Datei jetzt ersetzen? (j/n) " choice_after_show
            case "$choice_after_show" in
                j)
                    echo "$standard_content" > ~/.bash_profile
                    echo "Die Datei ~/.bash_profile wurde durch den Standardinhalt ersetzt."
                    ;;
                n)
                    echo "Die Datei ~/.bash_profile bleibt unverändert."
                    ;;
                *)
                    echo "Ungültige Eingabe. Die Datei ~/.bash_profile bleibt unverändert."
                    ;;
            esac
            ;;
        *)
            echo "Ungültige Eingabe. Die Datei ~/.bash_profile bleibt unverändert."
            ;;
    esac
else
    echo "$standard_content" > ~/.bash_profile
    echo "Die Datei ~/.bash_profile wurde erstellt und mit dem Standardinhalt gefüllt."
    cat ~/.bash_profile
    source ~/.bash_profile
fi

# 2. vim-plug installieren
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
