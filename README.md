This repo is inspired by this blog post:
    http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

#Installed with:

    git clone https://github.com/andyque/dotvim.git ~/.vim

    ln -s ~/.vim/vimrc ~/.vimrc
    
    cd ~/.vim

    git submodule init

    git submodule update
#Tips:
    if you want to use the full power of these vim plugins, you should install python,ruby ctags,jsctags

#if you want to update all submodules, you can
    git submodule foreach git pull orign master
##TODO
    find all plugins's github version,and update all to use pathogen if necessary
