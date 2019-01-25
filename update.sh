#!/bin/sh

# This is just to update, so we need to move the vimrc and install any added plugins
# move vimrc to .vimrc
cp ./vimrc ~/.vimrc

# download Vundle plugins
vim +PluginInstall +qall

