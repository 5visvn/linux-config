#! /bin/bash

emacs=`which emacs`
echo "dumping emacs for $emacs"
$emacs --batch --load ~/.emacs.d/init.el --execute "(dump-emacs-portable \"~/dumpedemacs\" \"$emacs\")"
