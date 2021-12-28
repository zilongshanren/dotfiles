#!/bin/bash

rm ~/.emacs-profiles.el
ln -s ~/.vim/.emacs-profiles.el ~/.emacs-profiles.el

rm ~/.emacs-profile
ln -s ~/.vim/.emacs-profile ~/.emacs-profile

