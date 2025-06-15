# sets enemy variable to a Goblin
# enemy variables will be reset each time an enemy is spawned to fight
# only one enemy can be fought at a time

enemy_type="Goblin"
enemy_health=30
enemy_defence=3
enemy_power=5

enemy_score=2

enemy_colours=("${game_text_green}" "${game_text_dark_green}")

log "INFO: ${enemy_type} loaded"
