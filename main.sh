#!/bin/bash

# This script is the entry point for the game

# Error segments with colours to be used when printing errors
err_x_msg_seg="\033[31mX\033[39m"      # used when printing to game screen, programme should continue
err_msg_seg="\033[33mERROR:\033[39m"   # programme should be exited after using this either with exit or return
reset_msg_seg="\033[0m\n" # this resets terminal colours to original colours

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

# log version determined by the branch
if [[ $(git rev-parse --abbrev-ref HEAD) == $release_branch_name ]]; then
    log "INFO: update: ${game_version} ${update}"
else
    log "INFO: update: ${game_version} ${working_on}"
fi
 # exits if the terminal is too small
 log "INFO: checking terminal size"
 terminal_width=$(tput cols)
 if [[ $terminal_width -lt $gamescreen_min_width ]]; then
     log "ERROR: terminal width to small: $terminal_width, min width = $gamescreen_min_width"
     printf "${err_msg_seg} terminal width to small: $terminal_width, min width = $gamescreen_min_width${reset_msg_seg}"
     exit 1
 fi
 terminal_height=$(tput lines)
 if [[ $terminal_height -lt $gamescreen_min_height ]]; then
     log "ERROR: terminal height to small: $terminal_height, min height = $gamescreen_min_height"
     printf "${err_msg_seg} terminal height to small: $terminal_height, min height = $gamescreen_min_height${reset_msg_seg}"
     exit 1
 fi


# reset player charactor name
printf "Enter your name: "
player_name=$(get_input 20 string)
if [[ ${#player_name} -lt 1 ]]; then
    player_name="Anony"
    log "WARNING: player name was not set, default name: $player_name"
else
    log "INFO: player name was set to: $player_name"
fi

# set terminal to game_col_default
# Only the gameloop has the default colour
printf "${game_text_default}"

# Game loop
running=true
frame=1
while [[ $running == true ]]; do
# Prints the game border
clear
draw

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
    printf "\nYOU WIN :D\n-> score: $game_score${reset_msg_seg}" # will call end screen function
    printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}${reset_msg_seg}" # temp code
    log "INFO: no more enemies, player wins"
    running=false
    exit 0
fi
# add to score and load next enemy if current enmey is dead
if [[ $enemy_health -le 0 ]]; then
    enemy_path="${current_room[$current_enemy]}"
    source "$enemy_path"
    ((current_enemy++)) # current enemy becomes the next enenmy in the room list
    enemy_col=$(set_enemy_colour) # sets enemy colour
    game_score=$((game_score + enemy_score))
fi

# get user input for option
printf "\033[22;3H"  # move curser to input area
printf "Enter an option: "
player_option=$(get_input ${#player_options_arr[@]})

if [[ $player_option -eq 0 ]]; then
    log "WARNING: player ended the game"
    printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}${reset_msg_seg}" # will call end screen function
    exit 2
fi

# generate enemy option from last didgit of a random number 1-2
enemy_option=$(($RANDOM % (3 - 1) + 1))
game_battle

# exits game if player is dead
if [[ $player_health -lt 1 ]]; then
    log "INFO: player has died, health: $player_health"
    printf "You Died :(\n" # will call end screen function
    printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}${reset_msg_seg}" # temp code
    running=false
    exit 0
fi

# log if enemy is dead
if [[ $enemy_health -lt 1 ]]; then
    log "INFO: ${enemy_type} was slain" # will call funciton that prints in the screen logs area
fi

((frame++))
done

printf "Final Score: ${game_text_yellow}${game_score}${game_text_default}\n"
log "INFO: game ended naturally"
