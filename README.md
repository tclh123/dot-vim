Tclh123's Vim config
==================

Originaly forked from [Maple's Vim config](https://github.com/humiaozuzu/dot-vimrc).

## Install

```
cd dot-vimrc
./install.sh
```

## vim-flake8

[Flake8](https://pypi.python.org/pypi/flake8/) is a wrapper around PyFlakes (static syntax checker), PEP8 (style checker) and Ned's MacCabe script (complexity checker).

[vim-flake8](https://github.com/nvie/vim-flake8) is supersedes both vim-pyflakes and vim-pep8.

```
pip install flake8
```

Or,

```
pip install pyflakes # only syntax check
```

pyflakes also can used by [syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim.

## How to manage this vimrc?

All plugins are listed in file `bundles.vim` with detailed comments, just add plugins as you like.

1. `:BundleClean` to clean up unused plugins
2. `:BundleInstall` to install newly added plugins
3. `:BundleInstall!` to upgrade all plugins
