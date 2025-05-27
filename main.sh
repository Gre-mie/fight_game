#!/bin/bash

# This script is the entry point for the game

# Game setup
# load necessary functions globally
. ./functs/debug.sh
. ./functs/game_functions.sh

# load global variables
log "INFO: loading global variables"
. ./vars/entities/player.sh


# reset player charactor name
printf "Enter your name: "
player_name=$(get_input 20 string)
printf "player name: ${player_name}\n"


# Game loop
# all game logic for updating
running=true
frame=1
while [[ $running == true ]]; do
log "INFO: starting game loop..."

# getting input from user should go here
printf "Enter an option: "
player_option=$(get_input 1)
printf "\nplayer option: ${player_option}\n"

# update logic should go here

# temp exit condition
if [[ $frame -ge 5 ]]; then
running=false
fi


#draw
((frame++))
done

log "INFO: game loop ended naturally"
