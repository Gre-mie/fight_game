# A place to put global variables that can be loaded during setup
# do NOT add variables directly related to the game loop

# window/terminal variables



# game variables 
game_version="v0.3.0"
last_updated_feature="game score system" # this is hear mostly to remind myself to think about what a feature is

# log version and last feature update
log "INFO: ${game_version} last update: ${last_updated_feature}"

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
