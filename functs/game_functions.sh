# contains functions for game logic and formatting

# Draws to the screen
draw() {
    clear
    printf "frame: ${frame}\n"
    sleep 0.25
}

# logic to simulate a battle between player and current enemy
# changes global player/enemy variables according to player/enemy options
    # option 1 = attack (player and enemy)
    # option 2 = defend (player and enemy)
game_battle() {
    printf "options  player: $player_option  enemy: $enemy_option\n"

    # run animations, function that runs animaitons, order to run determined by player/enemy options

    # battle logic
    if [[ ${player_option} -eq 1 ]]; then
        log "INFO: ${player_name} attacks ${enemy_type}"
        if [[ $enemy_option -eq 2 ]]; then          # A D
            log "INFO: ${enemy_type} defends"
            # calculate damage to enemy with defence

        elif [[ $enemy_option -eq 1 ]]; then            # A A
            # calculate damage to enemy 

            # check enemy is alive
            if [[ $enemy_health -gt 0 ]]; then
                log "INFO: ${enemy_type} attacks"
                #calculate damage to player
            fi
        fi

    # player defending = option 2
    elif [[ $player_option -eq 2 ]]; then
        if [[ $enemy_option -eq 1 ]]; then          # D A
            log "INFO: ${enemy_type} attacks"
                # calculate damage to player with defence
            log "INFO: ${player_name} defends"
            
        elif [[ $enemy_option -eq 2 ]]; then              # D D
            log "INFO: ${player_name} defends"
            log "INFO: ${enemy_type} defends"

        fi
    fi   

}
