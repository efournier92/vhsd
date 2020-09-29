#!/bin/bash

#----------------
# Name          : video_defaults
# Description   : Returns contstants
#----------------

source ./utilities/time.bash

timestamp_regex() {
  echo "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"
}

default_output_directory() {
  echo "./_vhsd_out"
}

default_output_file() {
  echo "`default_output_directory`/`time_now`.mp4"
}

default_batch_file() {
  echo "`default_output_directory`/vhsd_batch.txt"
}

default_input_video_size() {
  echo "640x480"
}

default_input_video_format() {
  echo "v4l2"
}

default_input_audio_format() {
  echo "alsa"
}

default_dimensions() {
  echo "720x540"
}

default_start_time() {
  echo "00:00:00.000"
}

default_stop_time() {
  echo "06:00:00.000"
}

# TODO: Remove
default_crf() { 
  echo "28"
}

default_preset() {
  echo "slow"
}

default_crop() {
  echo "in_w-2*20:in_h-2*20"
}

default_video_codec() {
  echo "libx264"
}

default_tune() {
  echo "film"
}

default_standard() {
  echo "ntsc"
}

default_format() {
  echo "mpeg"
}

default_extension() {
  echo "mp4"
}

default_max_threads() {
  echo "512"
}

default_max_queue() {
  echo "400"
}

