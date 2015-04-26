# .bash_profile: Called for initial login shell

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/repos/dot-files/bin/git-completion.bash ]; then
    . ~/repos/dot-files/bin/git-completion.bash
fi

if [ -f ~/repos/dot-files/bin/git-prompt.sh ]; then
    . ~/repos/dot-files/bin/git-prompt.bash
fi

export PATH=$PATH:$HOME/bin
