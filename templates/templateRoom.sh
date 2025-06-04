# Template for a room variable file
    # copy to: ./vars/rooms/
    # NOTE: name for room files should be in the format: room<num>.sh
    # look in the rooms/ directory to find last room file number and increment by one for the new room

# holds a list of enemy paths for room !!! add room number

# !!! list enemies with their score
# room score = !!! total up enemy points

if [[ $current_enemy -ge ${#current_room[@]} ]]; then
    current_room=() # !!! add enemy paths
    log "INFO: room <num> loaded" # !!! add room number
else
    log "WARNING: failure to load room <num>, ${#current_room[@]} enemies were still in room" # !!! add room number
fi
