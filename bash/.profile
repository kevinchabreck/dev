
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set prompt color based on the hostname
GRAY="[1;30m"
PURPLE="[1;35m"
RED="[1;31m"
CYAN="[1;31m"
YELLOW="[1;33m"

if [[ $HOSTNAME =~ .*(^|\.)(dev)\..* ]]; then
    HOSTCOLOR=$GRAY
elif [[ $HOSTNAME =~ .*(^|\.)(qa|stage|test)\..* ]]; then
    HOSTCOLOR=$YELLOW
elif [[ $HOSTNAME =~ .*(^|\.)(prod)\..* ]]; then
    HOSTCOLOR=$RED
else
    HOSTCOLOR=$GRAY
fi

# use git prompt if .git-prompt.sh exists
if [ -f ".git-prompt.sh" ]; then
    . ".git-prompt.sh"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]" "\n% "'
else
    PS1='\[\e[1;32m\]\u\[\e[m\]\[\e$HOSTCOLOR\]@\H\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
fi

# history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# completion options
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# keybinds
bind '"\e\e[D": backward-word'    # alt + left
bind '"\e\e[C": forward-word'     # alt + right
bind '"\eOD": beginning-of-line'  # ctrl + left
bind '"\eOC": end-of-line'        # ctrl + right
bind '"\C-?": backward-kill-line' # ctrl + backspace

# custom aliases
if [ "$(uname)" == "Darwin" ]; then
    alias ls="ls -G"
    alias la="ls -lahG"
else
    alias ls="ls --color"
    alias la="ls -lah --color --group-directories --sort=version"
fi
alias gs="git status"
alias p="python"
alias dkr="docker"
alias compose="docker-compose"
