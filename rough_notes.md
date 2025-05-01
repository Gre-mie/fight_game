## The Game Loop

- print game state
- print options `1. attack  2. defend  3. use item`
- wait for a number input 1-`num of options`
- exicute action based on input, run calculations that change the state
- clear

### charactor info

name     - will be default name until user changes (another ticket)<br>
health    - Starting health (game ends when 0)<br>
defence - prevents damage (reduces the damage an enemy does)<br>
power   - causes damage on an enemy (how much damage is done)

### how defence is used:

calculate possible damage = attackers power<br>
calculate blocked damage = players defence / 2<br>
calculate final damage = possible damage - blocked damage<br>
player health - final damage

inventory  - (item_paths) <br>

### inventory useage info 

eg. ("bronze_sword" "bronze_shield" "health_potion")

name of the item in the inventory is the name of the file holding the item variables, eg `bronze_sword` = `./vars/items/bronze_sword.sh`

enemy exe will be called when spawning an enemy just before a fight starts


```
enemies_in_room = ("goblin" "goblin" "pixie")
for enemy in enemies_in_room; do
    load_vars("./vars/enemies/${enemy}.sh")
    while enemy_health > 0 and player_health > 0:
        fight
    if player health > 0; then
        print_game_over_screen
    else
        unset enemies_in_room[enenmy]
    fi
done
```

### items usage info

when item is picked up, stats change

```
pick_up "bronze_sword"

funciton pick_up() {
    
    if type weapon
        player_power+=weapon_power
}
```

## !!! NOT NEEDED !!! `set -u` solve this problem

when an item is removed, a new inventory array is built to remove unused indexes

```
# filters out empty indexes from an inventory

function resize_arr() {
 #   local new_inventory=() # local used to keep scope inside the function
  #  for item in "$@"; do
   #     if [[ -n "$item" ]]; then
    #    new_inventory+=("$item")
     #   fi
#    done
 #   echo "$new_inventory[@]"
    local new_arr="$@"
    return ${new_arr[@]}
}
```
```
# create new inventory state, copy inventory with new item at end
player_inventory = (item1, item2, item3) # starting inventory
unset player_inventory[1] # index for player_inventory[1] is still present, but empty
player_inventory=($(resize_arr "${player_inventory[@]}")) # sets the new inventory state
player_inventory+=("$item4") # add the new item

```
