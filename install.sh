#!/bin/bash
# Exit immediately if a subcommand fails.
set -e

BACKUPDIR="$HOME/dotfiles-backup/"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )
OK=yep
X="\033[31m✗\033[0m"  # Red X
V="\033[32m✓\033[0m"  # Green check mark

# Usage:
#     try "message" command arg1 arg2 ...
# Outputs the message, runs the command, reports success or failure.
# On failure, also outputs the output of the command.
function try {
    local logfile=$(mktemp -t bootstrap.XXXX)
    local msg="$1"
    shift
    # Write an "in progress" message to the terminal
    echo -ne "… \033[1m${msg}\033[0m"
    {
        # Try to tun the command, and put a green checkmark at the
        # beginning of the line if it succeeded...
        "$@" >$logfile 2>&1 \
        && echo -e "\r${V}";
    } || {
        # ...but on failure, make that a red X, show the output of the
        # command that failed and exit.
        echo -e "\r${X}" \
        && echo -e "\033[31m# ${@}\033[0m" \
        && cat $logfile \
        && exit;
    }
    return $status
}

function warn {
    echo -e "${X} ${@}"
}

function fail {
    warn "${@}"
    OK=nope
}

function good {
    echo -e "${V} ${@}"
}

function nofail {
    if [[ "${OK}" != "yep" ]]; then
        exit 1
    fi
}

function display_usage {
    echo "Usage: ./install.sh [options]"
    echo "Options:"
    echo -e "-h, --help\tDisplay usage"
    echo -e "--include-vim\tInclude VIM setup"
    exit 0
}

link_file ()
{

  if [ -h "$HOME/$1" ]; then
    if [ "$(pwd -P $HOME/$1)/$1" == $DIR/$1 ]; then
      good "Your $1 is already linked up, good job!"
    else
      fail "Your $1 is already a symlink to something else, I'll leave you to fix that. Quickest fix is to delete the link and run this script again."
    fi
  else
    if [ -a "$HOME/$1" ]; then

      warn "Your $1 already exists, backing up to $BACKUPDIR and replacing."
      if [ $1 == .bashrc ] || [ $1 == .bash_profile ]; then
        warn "You might want to copy it into .bashrc.d if you want to keep it."
      fi
      mkdir $BACKUPDIR
      mv $HOME/$1 $BACKUPDIR

    fi

    ln -s $DIR/$1 $HOME/$1
    if [ $? -eq 0 ]; then
      good "$DIR/$1 successfully linked to $HOME/$1."
    else
      fail "$DIR/$1 failed to link to $HOME/$1. Investigate and try again."
      exit 1
    fi

  fi
}

INCLUDE_VIM=1
if [ $# -eq 1 ]; then
    CMD=$1
else
    CMD=1
fi

if [ $CMD == '-h' ] || [ $CMD == '--help' ] ; then
    display_usage
else
    if [ $CMD == '--include-vim' ] ; then
        INCLUDE_VIM=0
    fi
fi

link_file .bashrc
link_file .bashrc.d
link_file .bash_profile

# Vim Setup
if [ $INCLUDE_VIM -eq 0 ]; then
    link_file .vimrc
fi
