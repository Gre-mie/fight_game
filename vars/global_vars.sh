# A place to put global variables that can be loaded during setup
# do NOT add variables directly related to the game loop

# window/terminal variables



# game variables 
game_version="v0.1.2"
working_on="Graphics Update"
update="Battle Update" # this is here mostly to remind myself to think about what a feature is
release_branch_name="Release_Battle_update"

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
