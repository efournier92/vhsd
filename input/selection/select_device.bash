source $(dirname $0)/utilities/devices.bash

get_user_selection() {
  list_options="${1}"
  prompt_header="${2}"
  
  #printf "$prompt_header" >&2
  select selection in `${list_options}`; do
    echo "$selection"
  done
} 

#### Video input device
get_video_device_selection() {
  local device=`get_user_selection detect_video_devices "------\nSELECT VIDEO DEVICE\n------"`
  echo "$device"
  select selection in `${list_options}`; do
    echo "$selection"
  done
}

#### Audio input device
get_audio_device_selection() {
  select selection in `${list_options}`; do
    echo "$selection"
  done
  #local device=`get_user_selection detect_audio_devices "------\nSELECT AUDIO DEVICE\n------"`
  #echo "$device"
}

