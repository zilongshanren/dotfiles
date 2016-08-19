#!/bin/bash

export USE_CCACHE=1
export NDK_CCACHE=/usr/local/bin/ccache
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export ANDROID_NDK=/Users/guanghui/AndroidDev/android-ndk-r12b
export NDK_ROOT=/Users/guanghui/AndroidDev/android-ndk-r12b
export PATH=$NDK_ROOT:$PATH
export ANDROID_SDK_ROOT=/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk
export PATH=$ANDROID_SDK_ROOT/sdk/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
export ANT_ROOT=/Applications/Cocos/tools/ant/bin
export PATH=$PATH:$ANT_ROOT

export TIZEN_SDK=/Users/guanghui/tizen-sdk

export PATH=/Library/TeX/texbin:/usr/local/bin:$PATH
# for color
export CLICOLOR=1

alias g='git'
