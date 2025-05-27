#!/bin/bash

# This script is the entry point for the game

# Game setup
# load necessary functions globally
. ./functs/debug.sh
. ./functs/game_functions.sh

# load global variables
log "INFO: loading global variables"
. ./vars/entities/player.sh


# test code vvv

# need to write tests for get_input funciton 
    # check if exit code is 1 or 0


printf "\n> 'get_input 3'   \t"    exit code should be 1
get_input 3

printf "\n> 'get_input 555 string'\t"    exit code should be 1
get_input 555 string



printf "\nX 'get_input'              \t"           exit code should be 0
get_input

printf "\nX 'get_input one two three'\t"    exit code should be 0
get_input one two three

printf "\nX 'get_input bob'          \t"    exit code should be 0
get_input bob

printf "\nX 'get_input 100 bob'      \t"    exit code should be 0
get_input 100 bob

printf "\nX 'get_input 100 bo@'      \t"    exit code should be 0
get_input 100 bo@

printf "\nX 'get_input 100 44'       \t"    exit code should be 0
get_input 100 44





printf "\n"

# test code ^^^


# reset player charactor name
#player_name=$(get_input)
#printf "$player_name\n"


# Game loop
# all game logic for updating
running=true
frame=1
while [[ $running == true ]]; do
log "INFO: starting game loop..."

# getting input from user should go here

# update logic should go here

# temp exit condition
if [[ $frame -ge 5 ]]; then
running=false
fi


#draw
((frame++))
done

log "INFO: game loop ended naturally"
