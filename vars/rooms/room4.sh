# holds a list of enemy paths for room 4

printf "\ncurrent room 4\n"

if [[ ${#current_room[@]} == 0 ]]; then
    current_room=("enemy10" "enemy11" "enemy12")
    log "INFO: room 4 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 4, ${#current_room[@]} enemies were still in room"
fi
