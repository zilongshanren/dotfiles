This repo inspired by this blog post:
    http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/


#Installed with:

    git clone https://github.com/andyque/dotvim.git ~/.vim

    ln -s ~/.vim/vimrc ~/.vimrc
    
    cd ~/.vim

    git submodule init

    git submodule update

#if you want to update all submodules, you can
    git submodule foreach git pull orign master
