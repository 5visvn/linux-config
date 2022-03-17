#! /bin/bash

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak

ln -sf ~/linux-config/.bashrc ~/.bashrc

# ln -sf ~/linux-config/.emacs.d.vanilla/ ~/.emacs.d/
