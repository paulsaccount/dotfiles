#!/bin/bash

sym() {
    dotdir="$1"

    for filename in $(find $dotdir -name "*.symlink"); do
      ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
    done
}

dotfs=$(cd $(dirname $0) && pwd)

sym "$dotfs"

touch ~/dotfiles_ran
git clone git@github.com:paulsaccount/SecretDotfiles.git ~/.dotfiles/SecretDotfiles

export PATH=$PATH:~/.dotfiles/SecretDotfiles

~/.dotfiles/SecretDotfiles/install.sh