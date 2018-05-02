#!/usr/bin/env bash

set -exo pipefail

UDID=$(system_profiler SPUSBDataType | sed -n -E -e '/(iPhone|iPad)/,/Serial/s/ *Serial Number: *(.+)/\1/p')
WPA_PATH=$1
xcodebuild -project $WPA_PATH/WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination "id=${UDID}" test
