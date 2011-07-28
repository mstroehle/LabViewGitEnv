#!/bin/bash

# Read System wide config
if [ -e /usr/local/etc/LabViewConfig.sh ]
then
	source /usr/local/etc/LabViewConfig.sh
fi
# Read User Config
if [ -e ~/etc/LabViewConfig.sh ]
then
	source ~/etc/LabViewConfig.sh
fi
# Read Local Config
if [ -e ./LabViewConfig.sh ]
then
	source ./LabViewConfig.sh
fi

BASE="${WD}$(echo "$2" | sed -e "${TRAILFIX}")"
LOCAL="${WD}$(echo "$3" | sed -e "${TRAILFIX}")"
REMOTE="${WD}$(echo "$4" | sed -e  "${TRAILFIX}")"
MERGED=$LOCAL

# Execute Compare
"${LabViewShared}/LabVIEW Merge/LVMerge.exe" "${LabViewBin}" "${BASE}" "${LOCAL}" "${REMOTE}" "${MERGED}"
