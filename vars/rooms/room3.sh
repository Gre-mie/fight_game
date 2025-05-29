# holds a list of enemy paths for room 3

# goblin goblin hound goblin

printf "\ncurrent room 3\n"

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/hound.sh" "./vars/entities/enemies/goblin.sh")
    log "INFO: room 3 loaded"
    ((next_level++))
else
    log "WARNING: failure to load room 3, ${#current_room[@]} enemies were still in room"
fi
