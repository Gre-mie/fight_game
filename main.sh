#!/bin/bash

# This script is the entry point for the game

# Game setup
# load necessary functions globally
. ./functs/debug.sh
. ./functs/input_functions.sh
. ./functs/game_functions.sh

# load global variables
log "INFO: loading global variables"
. ./vars/entities/player.sh

# reset player charactor name
printf "Enter your name: "
player_name=$(get_input 20 string)

# Game loop
# all game logic for updating
running=true
frame=1
log "INFO: starting game loop..."
while [[ $running == true ]]; do

# getting input from user should go here
printf "Enter an option: "

test_arr=("0: exit" "1: example option" "2: example option") # !!! remove this
player_option=$(get_input ${#test_arr[@]})

printf "\nplayer option: ${player_option}\n"

# update logic should go here

# temp exit condition    !!! remove this
if [[ $frame -ge 2 ]]; then
running=false
fi


draw
((frame++))
done

log "INFO: game loop ended naturally"
