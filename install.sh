#!/bin/bash

# install depency software
# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
# install tmux
# brew install tmux
#install git 
#brew install git

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc
rm ~/.gitconfig
rm ~/.latexmkrc
rm ~/.zshrc
rm ~/.tmux.conf
ln -s ~/.vim/.gitconfig ~/.gitconfig
ln -s ~/.vim/.latexmkrc ~/.latexmkrc
ln -s ~/.vim/.zshrc ~/.zshrc
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
rm ~/.xvimrc
ln -s ~/.vim/.xvimrc ~/.xvimrc
ln -s ~/.vim/.vrapperrc ~/.vrapperrc
rm ~/.ctags
ln -s ~/.vim/.ctags  ~/.ctags


#echo "update submodules"
git submodule init
git submodule update


#echo "remove lua-ftplugin to prevent doc error msg"

# rm bundle/vim-lua-ftplugin/doc/lua-ftplugin.txt

# because I don't use submodule any more
#git submodule foreach git pull origin master
