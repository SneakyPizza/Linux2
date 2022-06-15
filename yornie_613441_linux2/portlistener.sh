#!/usr/bin/env bash

# Version:      1.0
# Created by:   Yornie Westink / 613441
# Email:        613441@student.inholland.nl
#
# Script:       Portlistener
# Description:  reads the input of the user and checks if a application is using the given port
# Variables:    PORTNUMBER = Input port of the user

# Read input of the user
read -p "Input specific port number: " PORTNUMBER

# CHECK /etc/services if the port is in use
if grep -q $PORTNUMBER  /etc/services
then 
   echo "Port is in use";
else
   echo "Port is not in use";
fi