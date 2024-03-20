#! /bin/bash

[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak

ln -sf ~/linux-config/.bashrc ~/.bashrc

# emacs setup
mkdir ~/.emacs.d/
ln -sf ~/linux-config/.emacs.d.vanilla/ ~/.emacs.d/
mkdir ~/elisp
git clone https://github.com/manateelazycat/nox ~/elisp/nox
# install lsp bridge for code completion
pip3 install epc orjson sexpdata six paramiko
git clone https://github.com/manateelazycat/lsp-bridge ~/elisp/lsp-bridge
git clone https://github.com/twlz0ne/acm-terminal ~/elisp/acm-terminal
git clone https://codeberg.org/akib/emacs-popon ~/elisp/popon

git clone https://github.com/gpakosz/.tmux ~/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/linux-config/.tmux.conf.local ~/.tmux.conf.local


#ln -sf ~/linux-config/.pathrc ~/.pathrc
ln -sf ~/linux-config/.gitconfig ~/.gitconfig
ln -sf ~/linux-config/.gitignore ~/.gitignore

git clone https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install


