#!/bin/bash

#----------------
# Name          : batch_mode_tests.bash
# Description   : Unit test batch-mode funcionality
#----------------

source ./modes/batch_mode.bash
source ./messages/errors.bash

test_batch_mode_with_no_args() {
  local message="It should "
  local expected_result=`error_missing_function_args "batch_mode" ""`
  
  local result=`batch_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

#suite_addTest test_batch_mode_with_no_args
