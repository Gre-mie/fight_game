# holds a list of enemy paths for room 6

# troll 4, hound 3, orc 5, fairy 1, goblin 2
# room score = 15

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=("./vars/entities/enemies/troll.sh" "./vars/entities/enemies/hound.sh" "./vars/entities/enemies/orc.sh" "./vars/entities/enemies/fairy.sh" "./vars/entities/enemies/goblin.sh")
    log "INFO: room 6 loaded"
else
    log "WARNING: failure to load room 6, ${#current_room[@]} enemies were still in room"
fi
