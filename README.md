```
curl -fLo ~/vim.sh --create-dirs https://gahlnbaeck.de/sh/vimsh
chmod +x ~/vim.sh
~/vim.sh
rm -f ~/vim.sh
```
oder
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
# Debuging
На федоре другая конфигурация, другие папки! 
Например, для начала, необходимо посмотреть в конце файлв /etc/vimrc что прописанно в качестве vimrc.local

```bash
if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif
```
А команда в консоли вим покажет папки, которые подгружаются с вим.

```
:set runtimepath?
⟫runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim91,/usr/share/vim/vim91/pack/dist/opt/netrw,/usr/share/vim/vimfiles/after,~/.vim/after
```
В моём случае я пытался /etc/vim/plugged использовать, а он не подключен.
Т.е. либо надо эту папку подключать, либо использовать уже подключенные!
Но я подумал, что мне нужна универсальная конфигурация, поэтому подключение универсального пути будет оптимальным. Добавляем в конфигурацию vimrc.local
```
set runtimepath^=/etc/vim
```
а после пробуем 
```
:PlugInstall
```
## Пользователь не видит
```bash
sudo chmod 755 /etc/vim/autoload
```
