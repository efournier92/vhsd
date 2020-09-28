source $(dirname $0)/input/selection/select_device.bash
source $(dirname $0)/constants/video_defaults.bash
source $(dirname $0)/utilities/time.bash

usage() {
  echo "Usage"
}

read_command_arguments() {
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

      -i | --input | --video_device )
        shift
        local input="$1"
        ;;

      -a | --audio_input )
        shift
        local audio_input="$1"
        ;;

      -ss | --start_time )
        shift
        local start_time="$1"
        ;;

      -t | --end_time )
        shift
        local end_time="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

      --size )
        shift
        local size="$1"
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --yadif )
        shift
        local yadif="$1"
        ;;

      --crop )
        shift
        local crop="$1"
        ;;

      -h | --help )
        usage
        exit
        ;;

      * )
        #usage
        ;;

    esac
    shift
  done

  [[ -z "$mode" ]] && local mode="test"
  [[ -z "$input" ]] && local input=`get_video_device_selection`
  [[ -z "$audio_input" ]] && local audio_input=`get_audio_device_selection`
  [[ -z "$start_time" ]] && local start_time=`get_default_start_time`
  [[ -z "$end_time" ]] && local end_time=`get_default_end_time`
  [[ -z "$size" ]] && local size=`get_video_size`
  [[ -z "$crf" ]] && local crf=`get_default_crf`
  [[ -z "$preset" ]] && local preset=`get_default_preset`
  [[ -z "$yadif" ]] && local preset=`get_default_yadif`
  [[ -z "$dimensions" ]] && local preset=`get_default_dimensions`
  [[ -z "$crop" ]] && local crop=`get_default_crop`
  [[ -z "$output_dir" ]] && local output_dir=`get_default_output_dir`
  [[ -z "$output_name" ]] && local output_name=`get_time_right_now`

  echo "$mode" "$input" "$audio_input" "$start_time" "$end_time" "$size" "$crf" "$preset" "$yadif" "$dimensions" "$crop" "$output_dir" "$output_name"
}

