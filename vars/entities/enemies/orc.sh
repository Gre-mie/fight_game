# sets enemy variable to a Orc
# enemy variables will be reset each time an enemy is spawned to fight
# only one enemy can be fought at a time

enemy_type="Orc"
enemy_health=35
enemy_defence=9
enemy_power=25

enemy_score=5

enemy_colours=("${game_text_light_blue}" "${game_text_blue}" "${game_text_white}" "${game_text_grey}")

log "INFO: ${enemy_type} loaded"
