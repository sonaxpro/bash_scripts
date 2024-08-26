```
git clone https://github.com/sonaxpro/bash_scripts.git
```

### Alias

Die Datei ~/.bash_profile existiert bereits. Möchten Sie sie durch den Standard von Sonax ersetzen? (j/n/z)


### Vim
passiert automatisch
vim +PlugInstall +qall
vim +source ~/.vimrc +qall

3. :PlugInstall
4. :source ~/.vimrc



```
set number
set noswapfile
set nobackup
set nowritebackup
set viminfo=

call plug#begin("/etc/vim/plugged")
Plug 'preservim/nerdcommenter' " NUR ein mal '! Zwei mal " passt nicht!!!!
call plug#end()

" nerdcommenter
let mapleader = ","
let g:NERDSpaceDelims = 1 
```
