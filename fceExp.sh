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
    # If not set in env, use first script parameter
    FIJI_PATH=$1
fi

# Exit if we don't have a FIJI path
if [ ! -d "${FIJI_PATH}" ];
  then
    echo -e "${RED}ERROR: Specified path to FIJI does not exist.  Either set the FIJI_PATH environment variable, or pass the path as the first parameter to the script!${NC}"
fi

CFG_PATH="TASBEImageAnalytics-Data/2018_07_23_FCE_test"

# Ensure Image Analytics Scripts are on CLASSPATH for FIJI
export CLASSPATH=$PWD/TASBEImageAnalytics/scripts:${CLASSPATH}


start=`date +%s`

# Part 1
echo -e "${RED}Starting partAll_stats_config${NC}"
${FIJI_PATH}/ImageJ-linux64 --heap 10240M --headless --run TASBEImageAnalytics/scripts/cellStats.py cfgPath=\"${CFG_PATH}/partAll_stats_config.ini\"
checkFailure "partAll_stats_config.ini"

end=`date +%s`
runtime=$((end-start))
echo -e "Runtime: ${runtime}"
