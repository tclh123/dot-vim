#!/usr/bin/env bash

set -e

here="$(cd "${0%/*}"; pwd)"

# symlink .vim/
ln -sfnv ${here#$HOME/} "${HOME}/.vim"

# symlink .vimrc
ln -sfnv "${here#$HOME/}/vimrc" $HOME/.vimrc
