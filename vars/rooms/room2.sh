# holds a list of enemy paths for room 2

printf "\ncurrent room 2\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("enemy3" "enemy4" "enemy5")
    log "INFO: room 2 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 2, ${#current_room[@]} enemies were still in room"
fi
