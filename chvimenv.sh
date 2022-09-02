#!/bin/sh

# -------------------------------------------------------------------------------------------------
# chvimenv - Change vim environment.
#   Arguments:
#     $1: vim_environment_name
#
# Version: 1.0.0
# Author: yuxki
# Repository: https://github.com/yuxki/chvimenv
# Last Change: 2022/9/2
# License:
# MIT License
#
# Copyright (c) 2022 Yuxki
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# -------------------------------------------------------------------------------------------------

prog_name='chvimenv'
vimenvs_dir="$HOME/.vim-venvs"

if [ $# -eq 0 ]; then
  echo \
"chvimenv - Change vim environment with symblic links.

  Arguments:
    \$1: vim_environment_name
          - Vim environment directory witch has a .vim directory and a .vimrc file.
              ~/.vim-venvs/vim_environment_name/.vim
              ~/.vim-venvs/vim_environment_name/.vimrc
  Usage:
    chvimenv vim_environment_name
"
  exit 0
fi

echo $vimenvs_dir/$1
while [ "$#" != "0" ]; do
  case $1 in
    *)
      if [ -d $vimenvs_dir/$1 ]; then
        venv_name=$1
      else
        echo "$prog_name: Not found $vimenvs_dir/$1 directory." 2>&1
        exit 1
      fi
      ;;
  esac
  shift
done

vimdir_path=`find ~ -maxdepth 1 -type l -name ".vim"`
vimrc_path=`find ~ -maxdepth 1 -type l -name ".vimrc"`
if [ ! -h $vimdir_path ] || [ ! -h $vimrc_path ]; then
  echo "$prog_name: ~/.vim and ~/.vimrc must be symbolic link because they will be deleted." 2>&1
else
  rm -rf $vimdir_path $vimrc_path
  ln -s $vimenvs_dir/$venv_name/.vim ~/.vim
  ln -s $vimenvs_dir/$venv_name/.vimrc ~/.vimrc
fi

exit 0
