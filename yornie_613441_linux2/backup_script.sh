#!/usr/bin/env bash

# Version:      1.0
# Created by:   Yornie Westink / 613441
# Email:        613441@student.inholland.nl
#
# Script:       Backup_script
# Description:  Creates a backup and place it in /tmp
# Variables:    SIGNATURE      = current timestamp
#               NAME           = Name of the backup
#               ARCHIVE        = Comination of name and signature, end file name


# Check if the directory exists
[[ ! -d $1 ]] && { echo "Please enter a path to the directory (ABSOLUTE PATH)"; exit 1; }

# Creating a Archive name
SIGNATURE=$(date +%s)
NAME="Backup"
ARCHIVE=$NAME.$SIGNATURE

# Making a tar and sending warnings to void
tar -czf $ARCHIVE.tar /tmp/a 2> /dev/null

# Check if the last exitcode isnt 0
if (($? != 0)); then
    echo "Unable to create tar"
    exit 1
fi

# Using Gzip to make a tgz
gzip < $ARCHIVE.tar > $ARCHIVE.tgz
mv $ARCHIVE.tgz /tmp/

# CRON Explaination
# Start at sunday 01:00, backup /home and redirect error (2>>) to /tmp/backup_error.log
# Example: 0 1 * * SUN <PATH/TO/backup_script> /home 2>> /tmp/backup_error.log
#

