export NAN_SOURCE="${NAN_SOURCE} -> shell/path.sh"

export NAN_SYSTEM_PATH="${NAN_SYSTEM_PATH:-$PATH}"

PATH="$NAN_SYSTEM_PATH"

export PATH