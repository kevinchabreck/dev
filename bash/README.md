# bash

A set of scripts and configurations that should work on most linux/unix environments

## Getting Started

1. Add [`.profile`](.profile) to the home directory
	- **local:**  `ln -s $(pwd)/.profile ~/.profile`
	- **remote:** `wget -O ~/.profile https://raw.githubusercontent.com/kevinchabreck/dev/master/bash/.profile`

1. Add [`.git-prompt.sh`](.git-prompt.sh) to the home directory
	- **local:**  `cp .git-prompt.sh ~/.git-prompt.sh`
	- **remote:** `wget -O ~/.git-prompt.sh https://raw.githubusercontent.com/kevinchabreck/dev/master/bash/.git-prompt.sh`

1. Add [`.emacs`](.emacs) to the home directory
	- **local:**  `ln -s $(pwd)/.emacs ~/.emacs`
	- **remote:** `wget -O ~/.emacs https://raw.githubusercontent.com/kevinchabreck/dev/master/bash/.emacs`

1. Add [`.vimrc`](.vimrc) to the home directory
	- **local:**  `ln -s $(pwd)/.vimrc ~/.vimrc`
	- **remote:** `wget -O ~/.vimrc https://raw.githubusercontent.com/kevinchabreck/dev/master/bash/.vimrc`
