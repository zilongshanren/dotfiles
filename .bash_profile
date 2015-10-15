#!/bin/bash

export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache
export COCOS_CONSOLE_ROOT=/Applications/Cocos/frameworks/cocos2d-x-3.8/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export ANDROID_NDK=/Users/guanghui/AndroidDev/android-ndk-r10d
export NDK_ROOT=/Users/guanghui/AndroidDev/android-ndk-r10d
export PATH=$NDK_ROOT:$PATH
export ANDROID_SDK_ROOT=/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk
export PATH=$ANDROID_SDK_ROOT/sdk/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
export ANT_ROOT=/Applications/Cocos/tools/ant/bin
export PATH=$PATH:$ANT_ROOT

export TIZEN_SDK=/Users/guanghui/tizen-sdk

export PATH=/usr/local/bin:$PATH
# for color
export CLICOLOR=1

# Add environment variable COCOS_FRAMEWORKS for cocos2d-x
export COCOS_FRAMEWORKS=/Applications/Cocos/frameworks
export PATH=$COCOS_FRAMEWORKS:$PATH
