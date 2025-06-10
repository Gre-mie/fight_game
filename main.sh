#!/bin/bash

# This script is the entry point for the game

# Game setup
# load necessary functions globally
. ./functs/debug.sh
. ./functs/input_functions.sh
. ./functs/game_functions.sh
. ./functs/game_screen_functions.sh

# load global variables
log "INFO: loading global variables"
. ./vars/text_apperance.sh
. ./vars/global_vars.sh
. ./vars/entities/player.sh

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

log "------------------------------------------ frame: $frame" # <<< temp code to make it easier to read logs

# Prints the game border
clear
print_border
#exit 3 # temp code

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
    printf "\nYOU WIN :D\n-> score: $game_score\n" # will call end screen function
    log "INFO: no more enemies, player wins"
    running=false
    exit 0
fi
# add to score and load next enemy if current enmey is dead
if [[ $enemy_health -le 0 ]]; then
    enemy_path="${current_room[$current_enemy]}"
    source "$enemy_path"
    ((current_enemy++))
    game_score=$((game_score + enemy_score))
fi

# temp vvv
# printf "${player_name} health: $player_health\t\t\t${enemy_type} health: $enemy_health\n\n" # print screen funciton called here
#max_levels=2
# temp ^^^

# get user input for option
player_options_arr=("0: exit" "1: attack" "2: defend")
printf "\033[22;3H"  # move curser to input area
printf "Enter an option: "
player_option=$(get_input ${#player_options_arr[@]})

if [[ $player_option -eq 0 ]]; then
    log "WARNING: player ended the game"
    printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}\n" # will call end screen function
    exit 2
fi

# generate enemy option from last didgit of a random number 1-2
enemy_option=$(($RANDOM % (3 - 1) + 1))
game_battle

# exits game if player is dead
if [[ $player_health -lt 1 ]]; then
    log "INFO: player has died, health: $player_health"
    printf "You Died :(\n" # will call end screen function
    running=false
fi

# log if enemy is dead
if [[ $enemy_health -lt 1 ]]; then
    log "INFO: ${enemy_type} was slain" # will call funciton that prints in the screen logs area
    printf "${enemy_type} was slain\n\n" # <<< temp code
fi

#draw
((frame++))
done

printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}\n"
log "INFO: game ended naturally"
