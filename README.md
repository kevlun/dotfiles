# Kevin Lund's dotfiles

These are my dotfiles. They were originally forked from [jacobtomlinson/dotfiles](https://github.com/jacobtomlinson/dotfiles)

###Features
* Prompt separated by colours
* User identifier changes colour depending on command return code
* Username changes colour based on whether superuser or not
* Displays current branch and status when in a git controlled directory
* Pretty man highlighing
* Grep highlighting
* Vi/Vim setup
* Homebrew autocompletion

## bashrc and bashrc.d

When developing my `.bashrc` I found it getting unwieldy and difficult to manage. Therefore I decided to create a `.bashrc.d` directory.

My `.bashrc` is now just a few lines which source all the files included in `.bashrc.d`. This makes it much easier to manage my files and separate them by program or category.

### Private files

Having my `.bashrc` content in separate files also allows me to create private files which may contain things like ssh aliases to private servers etc. This repository is configured to ignore any files in `.bashrc.d` which begin with the word "private", see [.bashrc.d/private_example](.bashrc.d/private_example) for an example.

That way I can keep my private aliases private.

## Installation

### Scripted

Just checkout the repo and run `./install.sh` which will create all the symlinks for you. Easy!

### Manual

Clone the repo and create symlinks from `~/.bashrc` to `/location/of/dotfiles/repo/.bashrc` for each item in this repo that you want to use. That way when you change things you can still track the changes in git.