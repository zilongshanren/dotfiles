This repo is inspired by this blog post:
    http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

#Installed with:

    git clone https://github.com/andyque/dotvim.git ~/.vim

    cd ~/.vim

    ./install.sh
#Optional
    sudo cp ~/.vim/Markdown.pl /usr/local/bin
#Enable blogit plugin
    you should modify plugin/Blogit.vim, set your own site address,username and password
#Tips:
    if you want to use the full power of these vim plugins, you should install python,ruby ctags,jsctags

#if you want to update all submodules, you can
    git submodule foreach git pull orign master
