#!/bin/bash

backup () {
  local FILE="$1"
  mv -vf "$FILE" "$FILE"~
}

backup "$HOME"/.bashrc
backup "$HOME"/.bash_aliases
backup "$HOME"/.gitconfig
backup "$HOME"/.inputrc
backup "$HOME"/.config/user-dirs.dirs

ln -vs "$PWD"/bashrc       "$HOME"/.bashrc
ln -vs "$PWD"/bash_aliases "$HOME"/.bash_aliases
ln -vs "$PWD"/gitconfig    "$HOME"/.gitconfig
ln -vs "$PWD"/inputrc      "$HOME"/.inputrc
ln -vs "$PWD"/user-dirs.dirs "$HOME"/.config/user-dirs.dirs
