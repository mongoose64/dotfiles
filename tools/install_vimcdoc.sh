#!/usr/bin/env sh

chinesevimdocurl='https://sourceforge.net/projects/vimcdoc/files/vimcdoc/vimcdoc-2.1.0.tar.gz/download'
if [ $(command -v wget) -a $(command -v tar) ]; then
  rm -fr /tmp/vimcdoc*
  wget ${chinesevimdocurl} -O /tmp/chinesevimdoc.tar.gz &&\
  tar -x -f /tmp/chinesevimdoc.tar.gz -C /tmp && cd /tmp/vimcdoc* &&\
  ./vimcdoc.sh -i &&\
  echo 'success install chinese vim doc'
else
  echo "need wget and tar for chinese vim doc"
fi
