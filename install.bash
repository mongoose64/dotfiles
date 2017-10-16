#!/usr/bin/env bash

BASEDIR=$(dirname $(readlink -f ${BASH_SOURCE}))
export BASEDIR

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
export -f make_link

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
export -f make_dir

append_line() {
  set -e

  local update line file pat lno
  update="$1"
  line="$2"
  file="$3"
  pat="${4:-}"
  lno=""

  echo "Update $file:"
  echo "  - $line"
  if [ -f "$file" ]; then
    if [ $# -lt 4 ]; then
      lno=$(\grep -nF "$line" "$file" | sed 's/:.*//' | tr '\n' ' ')
    else
      lno=$(\grep -nF "$pat" "$file" | sed 's/:.*//' | tr '\n' ' ')
    fi
  fi
  if [ -n "$lno" ]; then
    echo "    - Already exists: line #$lno"
  else
    if [ $update -eq 1 ]; then
      [ -f "$file" ] && echo >> "$file"
      echo "$line" >> "$file"
      echo "    + Added"
    else
      echo "    ~ Skipped"
    fi
  fi
  echo
  set +e
}

export -f append_line

# for vim
make_link "${BASEDIR}/vimrc" "${HOME}/.vimrc"
make_link "${BASEDIR}/vimconfig" "${HOME}/.vim"
make_link "${BASEDIR}/vimplug" "${HOME}/.local/share/vim/site/plugged" # like nvim, make the plugin into there

# for nvim
# already have init.vim
make_link "${BASEDIR}/vimconfig" "${HOME}/.config/nvim"
make_link "${BASEDIR}/vimplug" "${HOME}/.local/share/nvim/site/plugged"

bash ./tools/install_vimcdoc.bash
bash ./tools/install_vim-plug.bash

make_link ${BASEDIR}/bash_customs "${HOME}/.bash_customs"
bash ./tools/install_bash_customs.bash
bash ./tools/install_sbp.bash

make_link ${BASEDIR}/gitconfig "${HOME}/.gitconfig"

vim +PlugInstall +':q' +':q'
nvim +PlugInstall +':q' +':q'


