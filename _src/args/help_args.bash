#!/bin/bash

#----------------
# Name          : help_args.bash
# Project       : digitizer
# Description   : Interprets command arguments for showing help info
#----------------

source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"
source "./_src/messages/help.bash"

read_help_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [[ "$1" != "" ]]; do
    case $1 in

      -h | --help )
        local should_show_help=true
        ;;

    esac
    shift
  done
 
  if [[ "$should_show_help" == true ]]; then
    print_help_by_mode "$mode"
    exit
  fi
}

