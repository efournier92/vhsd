#!/bin/bash

#----------------
# Name          : devices_tests.bash
# Project       : digitizer
# Description   : Unit test device utilties
#----------------

source "./_src/utils/devices.bash"

test_detect_video_devices() {
  local message="It should use ls to find video devices."
  ls() { echo "/dev/video8 /dev/video9" ; }
  local expected_result="/dev/video8 /dev/video9"

  local result=`detect_video_devices`
  
  assertContains "$result" "$expected_device_name"
}

test_detect_audio_devices_with_single_device() {
  local message="It should return a properly formatted transformation of device returned from ls."
  ls() { echo "/dev/snd/pcmC8D8c" ; }
  expected_result="hw:8,8"

  local result=`detect_audio_devices`
  
  assertEquals "${expected_result}" "${result}"
}

test_detect_audio_devices_with_multiple_devices() {
  local message="It should return properly formatted transformations of devices returned from ls."
  ls() { echo "/dev/snd/pcmC7D7c /dev/snd/pcmC8D8c /dev/snd/pcmC9D9c" ; }
  local expected_result="hw:7,7 hw:8,8 hw:9,9"

  local result=`detect_audio_devices`
  
  assertEquals "${expected_result}" "${result}"
}

. ./bin/shunit2

