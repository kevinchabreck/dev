# don't forget to add iterm keybinds to send the following escapse sequences:
# 	copy
# 	backward-kill-line
#
# ex: http://superuser.com/questions/349439/how-to-bind-command-key-in-zsh

function copyline {
	zle vi-yank-whole-line
	echo -n $CUTBUFFER | pbcopy
}

zle -N copyline

bindkey '^[copy' copyline
bindkey '^[kill-line-backward' backward-kill-line
