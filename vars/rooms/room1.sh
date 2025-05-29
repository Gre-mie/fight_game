# holds a list for room 1

printf "\ncurrent room 1\n"

if [[ ${#current_room[@]} == 0 ]]; then
    current_room=("enemy1" "enemy2")
    log "INFO: room 1 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 1, ${#current_room[@]} enemies were still in room"
fi
