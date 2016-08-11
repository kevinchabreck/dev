# don't forget to add iterm keybinds to send the following escape sequences:
# 	copyline
#
# ex: http://superuser.com/questions/349439/how-to-bind-command-key-in-zsh

function copyline {
	zle copy-region-as-kill ""
	zle vi-yank-whole-line
	echo -n $CUTBUFFER | pbcopy
}
zle -N copyline

bindkey '^[copyline' copyline
