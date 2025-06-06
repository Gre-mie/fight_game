# A place to put global variables that can be loaded during setup
# do NOT add variables directly related to the game loop

# window/terminal variables
gamescreen_min_width=59      # cols
gamescreen_min_height=23     # lines

 # exits if the terminal is too small
 log "INFO: checking terminal size"

 terminal_width=$(tput cols)
 if [[ $terminal_width -lt $gamescreen_min_width ]]; then
     log "ERROR: terminal width to small: $terminal_width, min width = $gamescreen_min_width"
     printf "\033[33mERROR:\033[39m terminal width to small: $terminal_width, min width = $gamescreen_min_width\n"
     exit 1
 fi
 terminal_height=$(tput lines)
 if [[ $terminal_height -lt $gamescreen_min_height ]]; then
     log "ERROR: terminal height to small: $terminal_height, min height = $gamescreen_min_height"
     printf "\033[33mERROR:\033[39m terminal height to small: $terminal_height, min height = $gamescreen_min_height\n"
     exit 1
 fi


# game variables 
game_version="v0.1.1"
working_on="Graphics Update"
update="Battle Update" # this is here mostly to remind myself to think about what a feature is

# log version determined by the branch
if [[ $(git rev-parse --abbrev-ref HEAD) == $release_branch_name ]]; then
    log "INFO: update: ${game_version} ${update}"
else
    log "INFO: update: ${game_version} ${working_on}"
fi

game_score=0

# initialse level/room vars
next_level=1
max_levels=6
current_room=()
current_enemy=0

# initilise enemy vars
enemy_type=""
enemy_health=0
enemy_defence=0
enemy_power=0
