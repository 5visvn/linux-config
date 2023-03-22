#! /bin/bash

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak

ln -sf ~/linux-config/.bashrc ~/.bashrc

mkdir ~/.emacs.d/
ln -sf ~/linux-config/.emacs.d.vanilla/ ~/.emacs.d/
mkdir ~/elisp
git clone https://github.com/manateelazycat/nox ~/elisp/nox

git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/linux-config/.tmux.conf.local ~/.tmux.conf.local


#ln -sf ~/linux-config/.pathrc ~/.pathrc
ln -sf ~/linux-config/.gitconfig ~/.gitconfig
ln -sf ~/linux-config/.gitignore ~/.gitignore

git clone https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install


