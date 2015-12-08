I use Vundle to management my vim plugins. You can refer to this link for more information: [Vundle]( https://github.com/gmarik/vundle )

#Install with:

    git clone https://github.com/andyque/dotvim.git ~/.vim

    cd ~/.vim

    ./install.sh
    
#Install plugins

Open a arbitrary file and run the following ex command of vim:

    :BundleInstall
    Note: The BundleInstal commands will not install YouCompleteMe on default, you should uncomment it from *bundles.vim*

#Config YouCompleteMe plugin

You can refer to [this link](https://github.com/Valloric/YouCompleteMe) for more information.

#Tips:
    If you want to use the full power of these vim plugins, you should install python,ruby ctags,jsctags.

#For Windows Platform

    1. At first, you should download the [vim version](ftp://ftp.vim.org/pub/vim/pc/gvim74.exe)

    2. After downloading, you should clone this repository at your home directory. Here is the instructions.

    git clone https://github.com/andyque/dotvim.git

    3. copy the _vimrc file in the *dotvim* directory to your $Home$ directory

    4. Issue your gvim editor and input :BundleInstall to install the plugins

    5. Enjoy!


**Licence:**

Do What The Fuck You Want To Public License ([WTFPL](http://www.wtfpl.net/)).
