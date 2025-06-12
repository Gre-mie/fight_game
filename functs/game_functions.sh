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
    
    # run animations function to run animaitons. order to run determined by player/enemy options

    # most if not all logs in this file should also be printed to the screen logs area

    # battle logic
    if [[ ${player_option} -eq 1 ]]; then
        log "INFO: ${player_name} attacks ${enemy_type}"
        if [[ $enemy_option -eq 2 ]]; then              # A D
            log "INFO: ${enemy_type} defends"
            # calculate damage to enemy with defence
            damage=$(($player_power - $enemy_defence))
            if [[ $damage -lt 0 ]]; then
                damage=0
            fi
            enemy_health=$(($enemy_health - $damage))
            log "INFO: ${enemy_type} took $damage damage"

        elif [[ $enemy_option -eq 1 ]]; then            # A A
            enemy_health=$(($enemy_health - $player_power))
            log "INFO: ${enemy_type} took $player_power damage"

            # check enemy is alive
            if [[ $enemy_health -gt 0 ]]; then
                log "INFO: ${enemy_type} attacks ${player_name}"
                player_health=$(($player_health - $enemy_power))
                log "INFO: ${player_name} took $enemy_power damage"
            fi
        fi

    # player defending = option 2
    elif [[ $player_option -eq 2 ]]; then
        if [[ $enemy_option -eq 1 ]]; then              # D A
            log "INFO: ${enemy_type} attacks"
                # calculate damage to player with defence
                damage=$(($enemy_power - $player_defence))
                if [[ $damage -lt 0 ]]; then
                    damage=0
                fi
                player_health=$(($player_health - $damage))
            log "INFO: ${player_name} defends"
            log "INFO: ${player_name} took $damage damage"
            
        elif [[ $enemy_option -eq 2 ]]; then            # D D
            log "INFO: ${player_name} defends"
            log "INFO: ${enemy_type} defends"

        fi
    fi   

}
