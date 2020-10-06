#!/bin/sh

CONFIG_DIR=$1
TARGET=$2

version=`grep "latest_engine_api_version:" ${CONFIG_DIR}/_config.yml |cut -d'"' -f2`

sed -i -e "s/v{{ site.latest_engine_api_version }}/v${version}/" ${TARGET}
