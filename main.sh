#!/bin/bash

# This script is the entry point for the game

# load necessary files globally
. ./functs/debug/log.sh
. ./functs/paths/is_path.sh

#set -e

# Game setup
# load global variables
log "INFO: loading global variables"
. ./vars/entities/player.sh


# Game loop
running=true
frame=1
while [[ $running == true ]]; do
log "INFO: starting game loop..."

printf "frame: ${frame}\n"
sleep 0.25

# temp exit condition
if [[ $frame -ge 3 ]]; then
running=false
fi

((frame++))
done

log "INFO: game loop ended naturally"
return 0
