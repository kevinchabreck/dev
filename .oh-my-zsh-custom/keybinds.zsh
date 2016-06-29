# don't forget to add an iterm keybind to send a 'copy' escape sequence
# ex: http://superuser.com/questions/349439/how-to-bind-command-key-in-zsh
function copyline {
	zle vi-yank-whole-line
	echo -n $CUTBUFFER | pbcopy
}

zle -N copyline

bindkey '^[copy' copyline
