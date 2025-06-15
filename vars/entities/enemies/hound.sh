# sets enemy variable to a Hound
# enemy variables will be reset each time an enemy is spawned to fight
# only one enemy can be fought at a time

enemy_type="Hound"
enemy_health=20
enemy_defence=3
enemy_power=7

enemy_score=3

enemy_colours=("${game_text_grey}" "${game_text_white}" "${game_text_dark_yellow}" "${game_text_dark_red}")

log "INFO: ${enemy_type} loaded"
