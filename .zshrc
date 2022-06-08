# Path to your oh-my-zsh configuration.
export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"

#https://joshldavis.com/2014/07/26/oh-my-zsh-is-a-disease-antigen-is-the-vaccine/
#
# OS Detection
#

UNAME=`uname`

eval "$(/opt/homebrew/bin/brew shellenv)"
# Fallback info
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

source ~/.vim/antigen/antigen.zsh
# call antigen update on your terminal and it will update the oh-my-zsh repository
# antigen bundle robbyrussell/oh-my-zsh lib/
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle osx
antigen bundle ruby
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle gulp
antigen bundle node
#antigen bundle npm
antigen bundle nvm
antigen bundle bower

# Syntax highlighting bundle.
# don't enable this theme, it doesn't work well with ansi-term in emacs
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
# THEME=candy
# antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi


# Tell antigen that you're done.
antigen apply

# chruby
# source /usr/local/opt/chruby/share/chruby/chruby.sh
# source /usr/local/opt/chruby/share/chruby/auto.sh

# zsh
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# bash
# No ttyctl, so we need to save and then restore terminal settings
# vim()
# {
#     local STTYOPTS="$(stty --save)"
#     stty stop '' -ixoff
#     command vim "$@"
#     stty "$STTYOPTS"
# }

alias rake="noglob rake"

# [[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

alias e='emacsclient -t'
alias ec='emacsclient -c'

alias tmuxd="tmux attach -d"
alias gp="gulp"



eval "$(fasd --init auto)"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection


alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e open' # quick opening files with xdg-open
alias e='f -e emacsclient -t' # quick opening files with xdg-open


# added by travis gem
[ -f /Users/guanghui/.travis/travis.sh ] && source /Users/guanghui/.travis/travis.sh

export PATH="/usr/local/sbin":$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="/Applications/Emacs.app/Contents/MacOS/bin/:$PATH:/opt/homebrew/bin:/Users/lionqu/Library/Python/3.8/bin"


export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 10.16



function ppgrep() {

    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

function exists { which $1 &> /dev/null }

if exists percol; then
    echo  "bind  percol key"
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
source $HOME/.cargo/env
#export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7891
