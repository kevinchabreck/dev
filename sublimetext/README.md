sublimetext
======

Custom keyboard mappings for Sublime Text 3

Usage
-----

1. Install Sublime Text 3 (via [Homebrew](http://brew.sh/) and [Cask](http://caskroom.io/)).

		$ brew tap caskroom/versions
		$ brew cask install sublime-text3

2. Symlink `Default (OSX).sublime-keymap` into `~/Library/Application Support/Sublime Text 3/Packages/User`.

		$ ln -s $(pwd)/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap

3. Remove the existing sublime settings file and symlink `Preferences.sublime-settings` into its place.

		$ rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
		$ ln -s $(pwd)/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

4. Install [Package Control](https://packagecontrol.io/installation) and any necessary plugins. This includes, but is not limited to:
	* Markdown Preview
