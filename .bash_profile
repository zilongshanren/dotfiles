export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache
export COCOS_CONSOLE_ROOT=/Users/guanghui/cocos2d-x-v3/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export NDK_ROOT=/Users/guanghui/AndroidDev/android-ndk-r10c
export ANDROID_NDK=/Users/guanghui/AndroidDev/android-ndk-r10c
export PATH=$NDK_ROOT:$PATH
export ANDROID_SDK_ROOT=/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk
export PATH=$ANDROID_SDK_ROOT/sdk/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
export ANT_ROOT=/usr/local/bin
export PATH=$PATH:$ANT_ROOT
# add by quick-cocos2d-x setup, DATE: 2014-07-14 TIME: 18:15:11
export QUICK_COCOS2DX_ROOT=`cat ~/.QUICK_COCOS2DX_ROOT`
ANDROID_NDK_TOOLCHAIN_ROOT=/Users/guanghui/AndroidDev/android-ndk-r9d/toolchain

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
