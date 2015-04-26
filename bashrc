# .bashrc: Called for each new shell

BLUE='\[\e[0;34m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
RED='\e[0;31m'
OFF='\[\e[0m\]'

# time user@host pwd (branch)
export PS1="\[\e]0;\w\a\]\n$BLUE\t $GREEN\u@\h $YELLOW\w$RED$(__git_ps1)$OFF\n\\$ "

export CLICOLOR=true
export LSCOLORS="dxfxcxdxbxegedabagacad"
export PAGER=less
export EDITOR=emacs
export VISUAL=emacs
