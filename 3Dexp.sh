#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

checkFailure() {
    if [ ! $? -eq 0 ]
      then
        echo -e "${RED}Failed on $1${NC}"
        exit 1
    fi
}

# Get path to FIJI
if [ -z "${FIJI_PATH}" ]; # Test to see if it was set in the environment
  then
    # If not set in evn, use first script parameter
    FIJI_PATH=$1
fi

# Exit if we don't have a FIJI path
if [ ! -d "${FIJI_PATH}" ];
  then
    echo -e "${RED}ERROR: Specified path to FIJI does not exist.  Either set the FIJI_PATH environment variable, or pass the path as the first parameter to the script!${NC}"
    exit 1
fi

if [ ! -f "TASBEImageAnalytics/build/bin/applications/segment/elmSegmentation" ];
  then
    echo -e "${RED}ERROR: Segmentation binary does not exist! Must build C++ src prior to running!${NC}"
    exit 1
fi

CFG_PATH="TASBEImageAnalytics-Data/2017_12_05_fine_stacks"

# Ensure Image Analytics Scripts are on CLASSPATH for FIJI
export CLASSPATH=$PWD/TASBEImageAnalytics/scripts:${CLASSPATH}


start=`date +%s`

echo -e "${RED}Starting Config_just_blue_5um_F5${NC}"
${FIJI_PATH}/ImageJ-linux64 --heap 10240M --headless --run TASBEImageAnalytics/scripts/3DcellStats.py cfgPath=\"${CFG_PATH}/Config_just_blue_5um_F5.ini\"
checkFailure "Config_just_blue_5um_F5.ini"

end=`date +%s`
runtime=$((end-start))
echo "Runtime: ${runtime}"
