# holds a list of enemy paths for room 5

# goblin 2, troll 4, troll 4, hound 3
# room score = 13

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/troll.sh" "./vars/entities/enemies/troll.sh" "./vars/entities/enemies/hound.sh")
    log "INFO: room 5 loaded"
else
    log "WARNING: failure to load room 5, ${#current_room[@]} enemies were still in room"
fi
