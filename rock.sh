echo "copy all the dot files"

echo "cd to .vim directory"
cd ~/.vim


rm ~/.gitconfig
rm ~/.latexmkrc
rm ~/.zshrc
rm ~/.tmux.conf
rm ~/.tmux-mac
rm ~/.flake8rc
rm ~/.luacheckrc
rm ~/.eslintrc
rm ~/.jshintrc 
rm ~/.agignore
rm ~/.jsbeautifyrc
# rm ~/.zshenv
rm ~/.npmrc
rm ~/tslint.json
rm ~/.ruby-version
ln -s ~/.vim/.gitconfig ~/.gitconfig
ln -s ~/.vim/.latexmkrc ~/.latexmkrc
ln -s ~/.vim/.zshrc ~/.zshrc
ln -s ~/.vim/.tmux.conf ~/.tmux.conf
ln -s ~/.vim/.tmux-mac ~/.tmux-mac
ln -s ~/.vim/.flake8rc  ~/.flake8rc
ln -s ~/.vim/.luacheckrc  ~/.luacheckrc
ln -s ~/.vim/.eslintrc  ~/.eslintrc
ln -s ~/.vim/.jshintrc  ~/.jshintrc
ln -s ~/.vim/.agignore  ~/.agignore
ln -s ~/.vim/.jsbeautifyrc ~/.jsbeautifyrc
# ln -s ~/.vim/.zshenv ~/.zshenv
ln -s ~/.vim/.npmrc ~/.npmrc
ln -s ~/.vim/tslint.json ~/tslint.json
ln -s ~/.vim/.ruby-version ~/.ruby-version
mkdir -p ~/.config/karabiner
ln -s ~/.vim/karabiner.json ~/.config/karabiner/karabiner.json

rm ~/.xvimrc
ln -s ~/.vim/.xvimrc ~/.xvimrc

rm ~/.vrapperrc
ln -s ~/.vim/.vrapperrc ~/.vrapperrc
rm ~/.ctags
ln -s ~/.vim/.ctags  ~/.ctags

rm -rf ~/.percol.d
mkdir ~/.percol.d
ln -s  ~/.vim/rc.py ~/.percol.d/rc.py

rm ~/.bash_profile
ln -s ~/.vim/.bash_profile ~/.bash_profile

rm ~/.ctags
ln -s ~/.vim/.ctags ~/.ctags

# rm ~/.spacemacs
# ln -s ~/.vim/.spacemacs ~/.spacemacs
rm ~/.pylintrc
ln -s ~/.vim/.pylintrc ~/.pylintrc
rm ~/.pentadactylrc
ln -s ~/.vim/.pentadactylrc ~/.pentadactylrc
