#!/usr/bin/env bash

append_line 1 '[ -f ~/.bash_customs/enable_customs.bash ] && source ~/.bash_customs/enable_customs.bash' "${HOME}/.bashrc" 
