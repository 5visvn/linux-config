. ~/.bashrc_bak
# .bashrc
source ~/tools/color.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. ~/.aliasrc
. ~/.pathrc
. ~/.bashrc-default

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
