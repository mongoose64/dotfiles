#!/usr/bin/env bash

cd /tmp
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo << eof
    should set you terminal font by yourself
eof
