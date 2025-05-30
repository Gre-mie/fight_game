# holds a list of enemy paths for room 1

# fairy 1, fairy 1
# room score = 2

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/fairy.sh")
    log "INFO: room 1 loaded"
else
    log "WARNING: failure to load room 1, ${#current_room[@]} enemies were still in room"
fi
