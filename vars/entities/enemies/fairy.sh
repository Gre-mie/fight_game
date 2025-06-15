# sets enemy variable to a Fairy
# enemy variables will be reset each time an enemy is spawned to fight
# only one enemy can be fought at a time

enemy_type="Fairy"
enemy_health=15
enemy_defence=0
enemy_power=3

enemy_score=1

enemy_colours=("${game_text_grey}" "${game_text_white}" "${game_text_yellow}" "${game_text_light_blue}")

log "INFO: ${enemy_type} loaded"
