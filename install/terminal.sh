#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

source ${MKO_PATH}/install/terminal-required.sh

echo "START INSTALLING TERMINAL APPS"
for installer in ${MKO_PATH}/install/terminal/*.sh; do 
    source $installer
done