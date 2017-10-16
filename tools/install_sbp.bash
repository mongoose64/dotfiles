#!/usr/bin/env bash

sbp_path="${BASEDIR}/tools/sbp"
sbprc_path="${BASEDIR}/bash_customs/sbprc.bash"

make_link ${sbp_path}/helpers/defaults.bash "$HOME"/.config/sbp/sbp.conf
append_line 1 "sbp_path=${sbp_path}" ${sbprc_path}
append_line 1 "source ${sbp_path}/sbp.bash" ${sbprc_path}
echo "SBP: You'll have to reload bash or source ~/.bashrc for changes to take effect"

