# holds a list of enemy paths for room 3

printf "\ncurrent room 3\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("enemy6" "enemy7" "enemy8" "enemy9")
    log "INFO: room 3 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 3, ${#current_room[@]} enemies were still in room"
fi
