# holds a list of enemy paths for room 6

printf "\ncurrent room 6\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("enemy16" "enemy17" "enemy18" "enemy19" "enemy20")
    log "INFO: room 6 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 6, ${#current_room[@]} enemies were still in room"
fi
