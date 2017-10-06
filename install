#!/usr/bin/env bash

vimcdocurl='https://sourceforge.net/projects/vimcdoc/files/vimcdoc/vimcdoc-2.1.0.tar.gz/download'
BASEDIR=$(dirname $(realpath $BASH_SOURCE))

make_link()
{
  if [ "$#" -ne 2 ]; then
    echo parameters count is not valid
    exit 1
  fi
  s="$(dirname $1)/$(basename $1)"
  t="$(dirname $2)/$(basename $2)"

  # echo source is ${s}
  # echo target is ${t}

  if [ ! -e $(dirname $t) ]; then
    echo dir $(dirname "$t") is not exist, will make it
    mkdir -p "$(dirname ${t})"
  fi
  if [ $(realpath ${t}) == $(realpath ${s}) ]; then
    echo already symbolic ${t} --\> ${s}
    return 0
  fi
  if [ ! -e "${s}" ]; then
    echo warning, source file or dir ${s} is not exist
  fi
  if [ ! -e ${t} ]; then
    ln -sf ${s} ${t}
  else
    echo ${t} will back as ${t}.bak
    mv ${t} ${t}.bak -f
    ln -sf ${s} ${t}
  fi
  echo success make link ${t} --\> ${s}
}

make_dir()
{
  if $# -lt 1; then
    echo at least one parameter
    exit 1
  fi
  for p in $(realpath "$@")
  do
    if [ -e "${p}" ]; then
       echo will back "${p}" as "${p}".bak
       mv "${p}" "${p}".bak -f
    fi
    mkdir "$p" -p
  done
}

# for vim
make_link "${BASEDIR}/vimrc" "${HOME}/.vimrc"
make_link "${BASEDIR}/vimconfig" "${HOME}/.vim"
make_link "${BASEDIR}/vimplug" "${HOME}/.local/share/vim/site/plugged" # like nvim, make the plugin into there

# for nvim
# already have init.vim
make_link "${BASEDIR}/vimconfig" "${HOME}/.config/nvim"
make_link "${BASEDIR}/vimplug" "${HOME}/.local/share/nvim/site/plugged"

bash ./tools/install_vimcdoc.sh
bash ./tools/install_vim-plug.sh


vim +PlugInstall +':q' +':q'
nvim +PlugInstall +':q' +':q'



