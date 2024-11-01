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
# Their choice of number color is a bit strange... I need more purple
echo "call s:HL(\"LineNr\", s:violet, \"\", \"\")" >> ./vim-colors-violet/colors/violet.vim
mv ./vim-colors-violet/colors/* ~/.vim/colors/
rm -rf ./vim-colors-violet

# This is very helpful when looking at latex or md files
echo "What is your preferred pdf viewer? Leave blank if you don't know."
read PDFV

# There was a time when you didn't know the name either.
# I don't want to be mean but I am going to assume they are a vanilla ubuntu user
if [ -z "$PDFV" ]
then
  echo "Your default pdf viewer will be set to evince.\nIf you do not have evince, I recommend finding out what pdf-viewer you currently use\n\n"
  PDFV="evince"
fi

# I have only met people who use bash and zsh, if you use fish or something else, forgive me
if [ -n "$BASH" ]
then
  echo "export MIKEPDF='$PDFV'" >> ~/.bashrc
elif [ -n "$ZSH_NAME" ]
then
  echo "export MIKEPDF='$PDFV'" >> ~/.zshrc
else
  echo "name of shell rc file (.bashrc, .zshrc, etc):"
  read SHELLRC
  if [ -n "$SHELLRC" ]
  then
    echo "export MIKEPDF='$PDFV'" >> "$HOME/$SHELLRC"
  fi
fi

# move vimrc to .vimrc
cp ./vimrc ~/.vimrc

# download Vundle plugins
vim +PluginInstall +qall

