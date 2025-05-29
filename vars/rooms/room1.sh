# holds a list of enemy paths for room 1

# fairy fairy

printf "\ncurrent room 1\n"

if [[ ${#current_room[@]} == 0 ]]; then
    current_room=("./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/fairy.sh")
    log "INFO: room 1 loaded"
    ((current_level++))
else
    log "WARNING: failure to load room 1, ${#current_room[@]} enemies were still in room"
fi
