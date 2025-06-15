# sets enemy variable to a Troll
# enemy variables will be reset each time an enemy is spawned to fight
# only one enemy can be fought at a time

enemy_type="Troll"
enemy_health=30
enemy_defence=5
enemy_power=10

enemy_score=4

enemy_colours=("${game_text_yellow}" "${game_text_purple}" "${game_text_pink}" "${game_text_yellow}" "${game_text_blue}")

log "INFO: ${enemy_type} loaded"
