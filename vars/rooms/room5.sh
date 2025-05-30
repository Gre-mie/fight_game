# holds a list of enemy paths for room 5

# goblin troll troll hound
# room score = 13

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/troll.sh" "./vars/entities/enemies/troll.sh" "./vars/entities/enemies/hound.sh")
    log "INFO: room 5 loaded"
    ((next_level++))
else
    log "WARNING: failure to load room 5, ${#current_room[@]} enemies were still in room"
fi
