 source ~/.bash_profile
 export PATH="$HOME/.cask/bin:$HOME/.cabal/bin:$PATH"

export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
export GOPATH="$HOME/workspace/golang"
export GOROOT="/usr/local/Cellar/go/1.1.1"
export PATH=$PATH:$GOPATH/bin

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/guanghui/cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/guanghui/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH


# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/guanghui/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH:/Applications/Racket\ v6.1.1/bin

export NVM_DIR="/Users/guanghui/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
