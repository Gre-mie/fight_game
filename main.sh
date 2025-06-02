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
while [[ $running == true ]]; do

# room and enemy loading logic
# loads the next level if current_room is empty and max_levels hasn't been suppassed
if [[ $next_level -le $max_levels && $current_enemy -eq "${#current_room[@]}" && $enemy_health -lt 1 ]]; then
    room_path="./vars/rooms/room${next_level}.sh"
    source "$room_path"
    current_enemy=0
    ((next_level++))
fi
# win condition is checked after room and enemy is loaded
if [[ $next_level -ge $max_levels && $current_enemy -ge "${#current_room[@]}" && $enemy_health -lt 1 ]]; then
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

# temp code vvv
#source ./vars/entities/enemies/goblin.sh
enemy_option=1
# temp code ^^^

game_battle

# temp vvv
printf "__ player __\nhealth: $player_health\ndefence: $player_defence\npower: $player_power\n"
printf "__ $enemy_type __\nhealth: $enemy_health\ndefence: $enemy_defence\npower: $enemy_power\n"
#max_levels=2
# temp ^^^

# exits game if player is dead
if [[ $player_health -lt 1 ]]; then
    log "INFO: player has died, health: $player_health"
    printf "You Died :(\n"
    running=false
fi

# log if enemy is dead
if [[ $enemy_health -lt 1 ]]; then
    log "INFO: ${enemy_type} was slain"
fi

#draw
((frame++))
done

log "INFO: game ended naturally"
