oh-my-zsh-custom
================

A few zsh/oh-my-zsh customizations. Much thanks to [Duprasville](https://github.com/duprasville/oh-my-zsh-custom).

Getting Started
---------------

1. Install Zsh (via [Homebrew](http://brew.sh/))
```shell
$ brew install zsh
```
2. Clone the oh-my-zsh repository

        $ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        
3. Clone this repository and copy the .oh-my-zsh-custom directory to root

		$ git clone https://github.com/kevinchabreck/dev.git
        $ cp -r dev/.oh-my-zsh-custom ~/.oh-my-zsh-custom

4. OPTIONAL Backup your existing ~/.zshrc file

        $ cp ~/.zshrc ~/.zshrc.orig

5. Create a new zsh config by copying the zsh template.

        $ cp ~/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc
        
7. Change shell to zsh

        $ chsh -s /bin/zsh
