#!/bin/bash

# This script is the entry point for the game

date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
printf "${date_time}INFO: log.txt cleared\n" > log.txt

# log format <date/time> <message status:> <message> 
# types of message status  INFO: ERROR:

log() {
    date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
    printf "$date_time$1\n" >> log.txt
}

log "ERROR: bla bla bla"

# TODO: add to contributing
# move log definition (top of file?)