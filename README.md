This repo is inspired by this blog post:
    http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

#Installed with:

    git clone https://github.com/andyque/dotvim.git ~/.vim

    cd ~/.vim

    ./install.sh
#Optional

- 1.enable markdown to html

        sudo cp ~/.vim/Markdown.pl /usr/local/bin

- 2.enable cocos2d-x & cocos2d-html tags .Open your terminal,cd to your home directory,input the following commands.

        mkdir workspace

        cd workspace

        mkdir cocos2d-x

        mkdir cocos2d-html5

    Now, you can put cocos2d-x(cpp,lua) project under ~/workspace/cocos2d-x directory,put cocos2d-html5 project under

    ~/workspace/cocos2d-html5

#Tips:
    if you want to use the full power of these vim plugins, you should install python,ruby ctags,jsctags

##if you want to update all submodules, you can
    git submodule foreach git pull origin master
