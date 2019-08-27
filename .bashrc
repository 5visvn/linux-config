# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# aliases
source ~/.aliasrc
# environment settings
source ~/.pathrc
source ~/.bashrc-default
# colorful shell
source ~/.colorshellrc


# unlimited bash history
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%d/%m/%y %T "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
