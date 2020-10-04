#!/bin/bash

source ./modes/capture_mode.bash
source ./messages/errors.bash

test_get_capture_command_with_no_aguments() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_capture_command"`
  
  local result=`get_capture_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_get_capture_command_with_no_aguments

