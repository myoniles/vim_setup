#!/bin/sh

# I assume that vim is installed

# first things first lets make the files needed
mkdir -p ~/.vim/
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# download colorscheme
git clone https://github.com/ashfinal/vim-colors-violet
mv ./vim-colors-violet/colors/* ~/.vim/colors/
rm -rf ./vim-colors-violet

# move vimrc to .vimrc
cp ./vimrc ~/.vimrc

# download Vundle plugins
vim +PluginInstall +qall

