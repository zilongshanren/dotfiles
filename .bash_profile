#!/bin/bash
export USE_CCACHE=1
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export ANDROID_NDK=/Users/lionqu/workspace/android-ndk-r20b/
export NDK_ROOT=/Users/lionqu/workspace/android-ndk-r20b/
export
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home
export ANDROID_NDK_ROOT=/Users/lionqu/workspace/android-ndk-r20b/
export PATH=$NDK_ROOT:$PATH
export ANDROID_SDK_ROOT=/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk
export PATH=$ANDROID_SDK_ROOT/sdk/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

export TIZEN_STUDIO_HOME=/Users/guanghui/tizen-studio

export PATH=/Library/TeX/texbin:/usr/local/bin:$PATH
# for color
export CLICOLOR=1

alias g='git'
source "$HOME/.cargo/env"
export PATH=/usr/local/bin/:/usr/local/Cellar/git/2.30.1/libexec/git-core:$PATH
export PERL5LIB=/usr/local/lib/perl5/site_perl/5.28.2/darwin-thread-multi-2level
alias grep="ggrep"
