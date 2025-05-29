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
next_level=1
max_levels=6
current_room=()
current_enemy=0

# initilise enemy vars
enemy_type=""
enemy_health=0
enemy_defence=0
enemy_power=0

# reset player charactor name
#printf "Enter your name: "
#player_name=$(get_input 20 string)

# Game loop
# all game logic for updating
running=true
frame=1
log "INFO: starting game loop..."
while [[ $running == true ]]; do

# loading rooms
# loads the next level if current_room is empty and there is another level
if [[ $next_level -le $max_levels && $current_enemy -eq "${#current_room[@]}" ]]; then # TODO: add empty room condition, if current_enemy >= len current_room
    room_path="./vars/rooms/room${next_level}.sh"
    source "$room_path"
    current_enemy=0
fi
# win condition is checked after room and enemy is loaded
if [[ $next_level -ge $max_levels && $current_enemy -ge "${#current_room[@]}" ]]; then
    # win condition
    # when next_level is greater than max_levels
    # and the current room is empty
    printf "\nYOU WIN :D\n"
    log "INFO: no more enemies, player wins"
    running=false
    exit 1
fi

# load next enemy if current enmey is dead
if [[ $enemy_health -le 0 ]]; then
    enemy_path="${current_room[$current_enemy]}"
    source "$enemy_path"
    ((current_enemy++))
fi


# getting input from user should go here
#printf "Enter an option: "

test_arr=("0: exit" "1: example option" "2: example option") # !!! remove this
#player_option=$(get_input ${#test_arr[@]})


# battle logic here



# temp code vvv

enemy_health=0
printf "enemy: ${enemy_type} killed\n"


# temp code ^^^



# temp code vvv prevent infinate loop
if [[ $frame -ge 25 ]]; then
    exit 1
fi
# temp code ^^^ prevent infinate loop



# check if player still alive
    # if not alive print loose condition
    # running=false



#draw
((frame++))
done

log "INFO: game loop ended naturally"
