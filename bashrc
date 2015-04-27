# .bashrc: Called for each new shell

if [ -f ~/repos/dot-files/bin/git-completion.bash ]; then
    . ~/repos/dot-files/bin/git-completion.bash
fi

if [ -f ~/repos/dot-files/bin/git-prompt.sh ]; then
    . ~/repos/dot-files/bin/git-prompt.sh
fi

BLUE='\[\e[0;34m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
RED='\e[0;31m'
OFF='\[\e[0m\]'

# time user@host pwd (branch)
export PS1="\[\e]0;\w\a\]\n$BLUE\t $GREEN\u@\h $YELLOW\w$RED\$(__git_ps1)$OFF\n\\$ "

export PATH=$PATH:$HOME/bin
export CLICOLOR=true
export PAGER=less
export EDITOR=emacs
export VISUAL=emacs

if [ -f ~/.local_bashrc ]; then
    . ~/.local_bashrc
fi
