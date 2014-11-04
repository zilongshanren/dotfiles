# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
        < on %{$fg[magenta]%}<branch>%{$reset_color%}>\
        < at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
        %{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
    patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)
$(virtualenv_info)$(prompt_char) '

RPROMPT='$(battery_charge)'


ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Example aliases
alias -s html=mate
alias -s rb=mate
alias -s py=mate 
alias -s js=mate
alias -s c=mate
alias -s java=mate 
alias -s txt=mate


# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby tmux autojump textmate)

source $ZSH/oh-my-zsh.sh
# export ANDROID_NDK_ROOT=~/AndroidDev/android-ndk-r9b
# export COCOS2DX=~/cocos2d-x
# export NDK_ROOT=~/AndroidDev/android-ndk-r9b
# export ANDROID_SDK_ROOT=~/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk

# export PATH=$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools
export PATH=/usr/local/bin:/usr/bin:$PATH



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export LC_ALL=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
export GOPATH="$HOME/workspace/golang"
export GOROOT="/usr/local/Cellar/go/1.1.1"
export PATH=$PATH:$GOPATH/bin

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# zsh
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
 ttyctl -f

 # bash
 # No ttyctl, so we need to save and then restore terminal settings
 vim()
 {
     local STTYOPTS="$(stty --save)"
     stty stop '' -ixoff
     command vim "$@"
     stty "$STTYOPTS"
 }

 alias rake="noglob rake"

 export PATH="$HOME/.cask/bin:$HOME/.cabal/bin:$PATH"

 alias e='emacsclient -t'
 alias ec='emacsclient -c'
 # alias vim='emacsclient -t'
 # alias vi='emacsclient -t'

 alias tmuxd="tmux attach -d"

 export PATH="/usr/local/share/npm/bin:$PATH"
 PATH=$(brew --prefix)/share/python:$(brew --prefix)/share/python/bin:$(brew --prefix)/share/python/sbin:$PATH
 PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH


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

 source ~/.bash_profile

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
