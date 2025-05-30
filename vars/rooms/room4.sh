# holds a list of enemy paths for room 4

# goblin hound hound troll
# room score = 12

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/goblin.sh" "./vars/entities/enemies/hound.sh" "./vars/entities/enemies/hound.sh" "./vars/entities/enemies/troll.sh")
    log "INFO: room 4 loaded"
    ((next_level++))
else
    log "WARNING: failure to load room 4, ${#current_room[@]} enemies were still in room"
fi
