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
. ./vars/global_vars.sh
. ./vars/text_apperance.sh

# reset player charactor name
printf "Enter your name: "
player_name=$(get_input 20 string)
if [[ ${#player_name} -lt 1 ]]; then
    log "WARNING: player name was not set"
else
    log "INFO: player name was set to: $player_name"
fi

# Game loop
running=true
frame=1
log "INFO: starting game loop..."
while [[ $running == true ]]; do

# room and enemy loading logic
# loads the next level if current_room is empty and max_levels hasn't been suppassed
if [[ $next_level -le $max_levels && $current_enemy -eq "${#current_room[@]}" ]]; then
    room_path="./vars/rooms/room${next_level}.sh"
    source "$room_path"
    current_enemy=0
    ((next_level++))
fi
# win condition is checked after room and enemy is loaded
if [[ $next_level -ge $max_levels && $current_enemy -ge "${#current_room[@]}" ]]; then
    printf "\nYOU WIN :D\n-> score: $game_score\n"
    log "INFO: no more enemies, player wins"
    running=false
    exit 1
fi
# add to score and load next enemy if current enmey is dead
if [[ $enemy_health -le 0 ]]; then
    enemy_path="${current_room[$current_enemy]}"
    source "$enemy_path"
    ((current_enemy++))
    game_score=$((game_score + enemy_score))
fi


# get user input for option
printf "Enter an option: "

test_arr=("0: exit" "1: example option" "2: example option") # !!! remove this
player_option=$(get_input ${#test_arr[@]})

# generate enemy option from last didgit of a random number 1-2
enemy_option=$(($RANDOM % (3 - 1) + 1))
player_health=$((player_health - 50)) # temp code <<<

game_battle

# exits game if player is dead
if [[ $player_health -lt 1 ]]; then
    log "INFO: player has died, health: $player_health"
    printf "You Died :(\n"
    running=false
fi


# temp code vvv cause next enemy to be loaded each frame

enemy_health=0
#printf "enemy: ${enemy_type} killed\n"

# temp code ^^^


# temp code vvv prevent infinate loop
if [[ $frame -ge 25 ]]; then
    exit 1
fi
# temp code ^^^ prevent infinate loop


#draw
((frame++))
done

log "INFO: game loop ended naturally"
