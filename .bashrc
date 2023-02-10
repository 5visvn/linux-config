# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

[ -f ~/.bashrc-default ] && . ~/.bashrc-default

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# aliases
[ -f ~/linux-config/.aliasrc ] && . ~/linux-config/.aliasrc

# environment settings
[ -f ~/.pathrc ] && . ~/.pathrc

# colorful shell
[ -f ~/linux-config/.colorshellrc ] && . ~/linux-config/.colorshellrc


# unlimited bash history
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT="%d/%m/%y %T "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
