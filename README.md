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

## CoC

Vim + Language servers

<https://github.com/neoclide/coc.nvim>

Install nvm, Node, yarn,

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 14
npm install --global yarn
```

Install & Build coc.nvim,

```
# Run this command in vim, it will clone the coc.nvim repo into .vim/bundle
# :BundleInstall 'neoclide/coc.nvim'

# Build coc.nvim (a node project)
cd ~/.vim/bundle/coc.nvim
yarn install
yarn build
```

It will generate the config dir `~/.config/coc` when you first start vim and loading the plugin.

### clangd

For C++/C/Objective-C, (see https://github.com/neoclide/coc.nvim/wiki/Language-servers#supported-features)

Install clangd, (see https://clangd.llvm.org/installation),
- For Mac OS X, `brew install llvm`
- For others: Most distributions include clangd in a clangd package, in a clang-tools package, or in the full llvm distribution.

For centos/redhat, the following commands will install clangd 7 (too old).

```
# ref https://moevis.cc/quick-guide-to-install-clang-in-centos/

yum install -y centos-release-scl
yum install -y llvm-toolset-7.0-clang-tools-extra
source /opt/rh/llvm-toolset-7.0/enable
```

Build clangd from source,

```

git clone --depth=1 https://github.com/llvm/llvm-project.git

cd llvm-project
mkdir build && cd build

cmake --build `pwd` --target clangd -j8 && sudo cmake --install `pwd` --component clangd
```

refs:

- https://github.com/llvm/llvm-project/tree/main/clang-tools-extra/clangd#building-and-testing-clangd
- https://jdhao.github.io/2021/07/03/install_clangd_on_linux/

Use the vim command `:CocConfig` to open your user configuration file, and put

```
{
  "languageserver": {
    "clangd": {
      "command": "clangd",
      "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
      "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
    }
  }
}
```

More clangd configuration https://clangd.llvm.org/config

#### coc-clangd (optional)

https://github.com/clangd/coc-clangd

The coc extension connects coc.nvim to the clangd language server.

```vim
# Run this in vim
:CocInstall coc-clangd

# It will download coc-clangd into ~/.config/coc/extensions/node_modules/
```

## Generate compile_commands.json for clangd

### Bear

ref https://github.com/rizsotto/Bear/blob/master/INSTALL.md

For Redhat,

```
# No need to install dependencies manually, the cmake in bear project will download them.
# # Install protobuf & grpc
# # dnf install https://cbs.centos.org/kojifiles/packages/protobuf/3.6.1/4.el7/x86_64/protobuf-3.6.1-4.el7.x86_64.rpm
# dnf install https://cbs.centos.org/kojifiles/packages/protobuf/3.6.1/4.el7/x86_64/protobuf-compiler-3.6.1-4.el7.x86_64.rpm
# dnf install https://cbs.centos.org/kojifiles/packages/protobuf/3.6.1/4.el7/x86_64/protobuf-devel-3.6.1-4.el7.x86_64.rpm
# dnf install https://cbs.centos.org/kojifiles/packages/grpc/1.20.1/1.el7/x86_64/grpc-1.20.1-1.el7.x86_64.rpm
# dnf install https://cbs.centos.org/kojifiles/packages/grpc/1.20.1/1.el7/x86_64/grpc-plugins-1.20.1-1.el7.x86_64.rpm
# 
# # Other dependencies for bear
# dnf install json-devel spdlog-devel fmt-devel

# Download bear source code
curl -LO https://github.com/rizsotto/Bear/archive/refs/tags/3.0.13.tar.gz
tar xvf 3.0.13.tar.gz
cd Bear-3.0.13/

cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $BEAR_SOURCE_DIR
make all -j8
make install
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
