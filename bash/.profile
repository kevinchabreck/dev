
# color/git prompt
source ~/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]" "\n% "'

# history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# completion options
set completion-ignore-case on
set show-all-if-ambiguous on

# custom aliases
alias ls="ls -lah --color --group-directories --sort=version"
alias gs="git status"
