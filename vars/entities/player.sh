# set initial player charactor variables

player_name="" # name will be added
player_health=100
player_defence=5
player_power=10

player_inventory=()

# player stats should not exceed 3 digits to prevent printing issues in the game screen
if [[ $player_health -gt 999 || $player_defence -gt 999 || $player_power -gt 999 ]]; then 
    log "ERROR: player stats cannot be greater than 999"
    printf "${err_highlight_col}Error:${err_text_col} player stats cannot be greater than 999\n" >&2
    exit 1
fi
