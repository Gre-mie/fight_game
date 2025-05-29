# holds a list of enemy paths for room 5

# fairy troll troll

printf "\ncurrent room 5\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/troll.sh" "./vars/entities/enemies/troll.sh")
    log "INFO: room 5 loaded"
    ((next_level++))
else
    log "WARNING: failure to load room 5, ${#current_room[@]} enemies were still in room"
fi
