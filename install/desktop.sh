#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "START INSTALLING DESKTOP APPS"
for installer in ${MKO_PATH}/install/desktop/*.sh; do 
    source $installer
done