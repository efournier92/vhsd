#!/bin/bash

#----------------
# Name          : modes.bash
# Description   : Utility functions for mode detection
#----------------

source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/messages/errors.bash

is_mode_known() {
  local selected_mode="$1"

  [[ -z "$selected_mode" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"


  local known_modes=(`capture_mode_name` `cut_mode_name` `batch_mode_name` `join_mode_name` `watch_mode_name`)
  
  local is_known=false
  for mode in "${known_modes[@]}"; do
    [[ "$selected_mode" == "$mode" ]] && is_known=true
  done
  
  echo "$is_known"
}
