
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

# use git prompt if .git-prompt.sh exists
if [ -f ".git-prompt.sh" ]; then
    . ".git-prompt.sh"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]" "\n% "'
else
    PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
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
    alias ls="ls -lahG"
else
    alias ls="ls -lah --color --group-directories --sort=version"
fi
alias gs="git status"
alias p="python"
alias dkr="docker"
alias compose="docker-compose"
