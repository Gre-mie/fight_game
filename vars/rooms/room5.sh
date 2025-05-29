# holds a list of enemy paths for room 5

printf "\ncurrent room 5\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("enemy13" "enemy14" "enemy15")
    log "INFO: room 5 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 5, ${#current_room[@]} enemies were still in room"
fi
