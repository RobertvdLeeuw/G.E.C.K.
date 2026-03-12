#!/usr/bin/env bash

set -e

WORK_DIR="tmp"
ISO_OUTPUT="ISOs"

wget https://memtest.org/download/v7.20/mt86plus_7.20_64.iso.zip -O ${WORK_DIR}/downloads/mt.zip
unzip ${WORK_DIR}/downloads/mt.zip -d ${ISO_OUTPUT}
rm ${WORK_DIR}/downloads/mt.zip

wget https://www.hirensbootcd.org/files/HBCD_PE_x64.iso -P ${ISO_OUTPUT}
