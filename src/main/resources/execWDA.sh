#!/usr/bin/env bash

set -exo pipefail

PATH=$0
UDID=$(system_profiler SPUSBDataType | sed -n -E -e '/(iPhone|iPad)/,/Serial/s/ *Serial Number: *(.+)/\1/p')
xcodebuild -project {$PATH}/WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination "id=${UDID}" test