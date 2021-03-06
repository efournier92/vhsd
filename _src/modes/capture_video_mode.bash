#!/bin/bash

#----------------
# Name          : capture_mode.bash
# Project       : digitizer
# Description   : Run capture process to collect input from a stream
#----------------

get_capture_video_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local video_device="$1"
  local audio_device="$2"
  local codec="$3"
  local crf="$4"
  local video_format="$5"
  local audio_format="$6"
  local preset="$7"
  local size="$8"
  local standard="$9"
  local stop_time="${10}"
  local threads="${11}"
  local tune="${12}"
  local num_audio_channels="${13}"
  local output_format="${14}"
  local output_location="${15}"

  [[ -z "$video_device" || -z "$audio_device" || -z "$codec" || -z "$crf" || -z "$video_format" || -z "$audio_format" || -z "$preset" || -z "$size" || -z "$standard" || -z "$stop_time" || -z "$threads" || -z "$tune" || -z "$output_format" || -z "$output_location" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  [[ ! -e "$video_device" ]] && error_device_not_found "$video_device" "${FUNCNAME[0]}"

  echo "ffmpeg -standard $standard -f $video_format -video_size $size -thread_queue_size $threads -i $video_device -f $audio_format -thread_queue_size $threads -i $audio_device -c:v $codec -tune $tune -preset $preset -crf $crf -ac $num_audio_channels -t $stop_time -f $output_format - | ffmpeg -i - -c copy $output_location -c copy -f s32le pipe:play | ffplay -i pipe:play -nodisp"
}

run_capture_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  eval "$ffmpeg_command"
}

capture_video_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command=`get_capture_video_command "$@"`

  [[ -z "ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  echo "$ffmpeg_command" >&2
  run_capture_command "$ffmpeg_command"
}

