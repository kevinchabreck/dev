oh-my-zsh-custom
================

A few zsh/oh-my-zsh customizations. Much thanks to [Duprasville](https://github.com/duprasville/oh-my-zsh-custom).

Getting Started
---------------

1. Install Zsh (via [Homebrew](http://brew.sh/))

        $ brew install zsh

2. Clone the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) repository into your home directory

        $ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

3. Clone this repository

        $ git clone https://github.com/kevinchabreck/dev.git

4. symlink `.oh-my-zsh-custom` and `zshrc.zsh-template` into your home directory

		$ ln -s $(pwd)/dev/.oh-my-zsh-custom ~/.oh-my-zsh-custom
		$ ln -s $(pwd)/dev/.oh-my-zsh-custom/templates/zshrc.zsh-template ~/.zshrc

7. Change shell to zsh

        $ chsh -s /bin/zsh
