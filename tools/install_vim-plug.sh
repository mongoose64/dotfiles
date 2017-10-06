#!/usr/bin/env bash

if [ $(command -v curl) ]; then
  curl -fLo vimconfig/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    echo 'success install vim-plug for vim'
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo need curl for vim-plug
fi
