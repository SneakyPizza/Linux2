#!/usr/bin/env bash

# Version:      1.0
# Created by:   Yornie Westink / 613441
# Email:        613441@student.inholland.nl
#
# Script:       Remote copy
# Description:  
# Variables:    SOURCEPATH      = SOURCE OF FILE OR DIR
#               USERNAME        = USERNAME of user in remote location
#               HOST            = Hostname of the remote location


read -p "Source path (FILE OR DIR): " SOURCEPATH
read -p "Input username: " USERNAME
read -p "Input hostname: " HOST     #HOSTNAME is already in use

# Check if input string has 0 length and output error
[[ -z "$USERNAME" ]] && { echo "Username does not exist"; exit 1; }
[[ -z "$HOST" ]] && { echo "Host name does not exist"; exit 1; }
[[ -z "$SOURCEPATH" ]] && { echo "Sourcepath does not exist"; exit 1; }

# Check if the user has read premissions
[[ ! -r "$SOURCEPATH" ]] && { echo "No read premissions on ${SOURCEPATH}"; exit 1; }

# Send the file to /tmp at the remote location
scp $SOURCEPATH $USERNAME@$HOST:/tmp


