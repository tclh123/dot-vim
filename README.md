Tclh123's Vim config
==================

Originaly forked from [Maple's Vim config](https://github.com/humiaozuzu/dot-vimrc).

We use [vundle](https://github.com/gmarik/vundle) to manage plugins.

## Install

If you already have vim/ & .vimrc, backup them first.

```
mv ~/.vim ~/.vim.backup
mv ~/.vimrc ~/.vimrc.backup
```

Then, install,

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

## jshint

[JSHint](https://github.com/jshint/jshint) is a syntax checker for JavaScript.

```
npm install -g jshint
```

and [an example config file](https://raw.githubusercontent.com/jshint/jshint/master/examples/.jshintrc).

## How to manage this vimrc?

All plugins are listed in file `bundles.vim` with detailed comments, just add plugins as you like.

1. `:BundleClean` to clean up unused plugins
2. `:BundleInstall` to install newly added plugins
3. `:BundleInstall!` to upgrade all plugins
4. `:BundleInstall tclh123/vim-thrift` to install scripts by name.

see [more](https://github.com/gmarik/vundle/blob/master/doc/vundle.txt)
