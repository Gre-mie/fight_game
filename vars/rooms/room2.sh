# holds a list of enemy paths for room 2

# fairy 1, goblin 2, fairy 1
# room score = 4

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/fairy.sh")
    log "INFO: room 2 loaded"
else
    log "WARNING: failure to load room 2, ${#current_room[@]} enemies were still in room"
fi
