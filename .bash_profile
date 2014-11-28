export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache
export COCOS_CONSOLE_ROOT=/Applications/Cocos/frameworks/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export ANDROID_NDK=/Users/guanghui/AndroidDev/android-ndk-r10c
export NDK_ROOT=/Users/guanghui/AndroidDev/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH
export ANDROID_SDK_ROOT=/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk
export PATH=$ANDROID_SDK_ROOT/sdk/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
export ANT_ROOT=/Applications/Cocos/tools/ant/bin
export PATH=$PATH:$ANT_ROOT

export TIZEN_SDK=/Users/guanghui/tizen-sdk
export PATH=$TIZEN_SDK/tools/:$PATH
#
# Qu Jing iTerm & Terminal Setup Script
# version 0.3
# Felix Ding
# July 12, 2014 @Costa
#
function start_qujing {
  export http_proxy='http://theironislands.f.getqujing.net:36762'
  export HTTPS_PROXY='http://theironislands.f.getqujing.net:36762'
}
export PATH=/usr/local/bin:$PATH
