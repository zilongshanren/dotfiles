#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim


echo "create .vimrc"
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.gvimrc


echo "update submodules"
git submodule init
git submodule update

echo "remove lua-ftplugin to prevent doc error msg"

rm bundle/vim-lua-ftplugin/doc/lua-ftplugin.txt
