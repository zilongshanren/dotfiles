#!/bin/bash

# install depency software
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install fasd
brew install fasd
#install autojump
brew install autojump
# install tmux
brew install tmux
brew install reattach-to-user-namespace
brew install cmake
#install node and nvm
brew install node
brew install nvm
nvm install 16.15.1
# install tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# for ls & cat gnu version  for easing dired-quick-sort
brew install coreutils
brew install fd
brew install ripgrep

brew install pyenv
pyenv install 2.7.18
pyenv global 2.7.18
pip install percol

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.ideavimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc
ln -s ~/.vim/.ideavimrc ~/.ideavimrc

#echo "update submodules"
git submodule init
git submodule update
