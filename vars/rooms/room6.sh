# holds a list of enemy paths for room 6

# troll hound orc fairy goblin

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/troll.sh" "./vars/entities/enemies/hound.sh" "./vars/entities/enemies/orc.sh" "./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/goblin.sh")
    log "INFO: room 6 loaded"
    ((next_level++))
else
    log "WARNING: failure to load room 6, ${#current_room[@]} enemies were still in room"
fi
