#!/bin/bash

# install depency software
# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#install fasd
brew install fasd
#install autojump
brew install autojump
# install tmux
brew install tmux
brew install reattach-to-user-namespace
#install node and nvm
brew install node
brew install nvm
nvm install 10.16
#install percol
brew install python
pip install percol

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc

#echo "update submodules"
git submodule init
git submodule update


