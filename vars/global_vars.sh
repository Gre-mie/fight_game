# A place to put global variables that can be loaded during setup
# do NOT add variables directly related to the game loop

# version variables
game_version="v0.2.0"
working_on="Graphics Update"
update="Battle Update" # this is here mostly to remind myself to think about what a feature is

# window/terminal variables
gamescreen_min_width=59      # cols
gamescreen_min_height=23     # lines

# game variables 
player_options_arr=("0: exit" "1: attack" "2: defend")
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

# results of often used calculations
boarder_end=$(($gamescreen_min_width - 2))
