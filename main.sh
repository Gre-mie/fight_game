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
current_level=1
max_levels=6
current_room=()

# reset player charactor name
#printf "Enter your name: "
#player_name=$(get_input 20 string)

# Game loop
# all game logic for updating
running=true
frame=1
log "INFO: starting game loop..."
while [[ $running == true ]]; do

# getting input from user should go here
#printf "Enter an option: "

test_arr=("0: exit" "1: example option" "2: example option") # !!! remove this
#player_option=$(get_input ${#test_arr[@]})


# update logic should go here



# loads the next level if current_room is empty
if [[ $current_level -le $max_levels ]]; then # TODO: add empty room condition
    # load level
    room_path="./vars/rooms/room${current_level}.sh"
    source "$room_path"

    
    
    for ((i=0 ; i < ${#current_room[@]} ; i++)); do
        printf "  enemy $i : ${current_room[$i]}\n"
    done


    #((current_level++))
else
    # win condition
    # when current_level is greater than max_levels
    # and the current room is empty
    printf "\nYOU WIN :D\n"
    log "INFO: no more enemies, player wins"
    running=false
fi

# temp code vvv
    # used to prevent infinate loop
if [[ $frame -ge 3 ]]; then
    exit 1
fi

# temp code ^^^



# check if player still alive
    # if not alive print loose condition
    # running=false



#draw
((frame++))
done

log "INFO: game loop ended naturally"
