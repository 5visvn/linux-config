# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
source ~/.aliasrc
source ~/.pathrc
source ~/.bashrc-default
source ~/tools/color.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
