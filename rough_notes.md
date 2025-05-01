### Bash links

[Cheat Sheet](https://devhints.io/bash)<br>
[Tips and tricks](https://jvns.ca/blog/2017/03/26/bash-quirks/)<br>
[Random numbers in Bash](https://linuxsimply.com/bash-scripting-tutorial/operator/arithmetic-operators/random-number/)<br>

### Bash built in variables

- $RANDOM  - Produces a random number
- $LINES   - Returns number of lines in the terminal (height)
- $COLUMNS - Returns number of columns in the terminal (width)

### Bash Syntax:

`#!/bin/bash`

`set -e` at the top of a file will cause the programme to stop if an error occures 
`set -u` will prevent unset variables or indexes from being accessed

**unpacking a list of items into a function will result in empty indexes being removed**

- `(  )` `((  ))` - subshell exicution - exicute in another shell returning the result (does not affect current shell)
        + you can exicute a command and save the output to a var using `var=$(command)` (interpolate command output, use the output as the input)
- `{  }` - command grouping - exicute group of commands in current shell (affects current shell)
        + use `${var}` when joining text, eg `"${directory_path}/file.txt"`
        + `export` will create an environment variable see all environment vars using `env` command
        + all over variables are global by default
        + `local` - use local keyword to set a variable to a local scope, to prevent overwriting
- `[  ]` `[[  ]]` - test condition and array operator 
        + used for conditionals, must have space either side
        + used to get element from an array index
- `test` command can be used to test conditions, returning 0 for true, and anything else for false
        + eg `test -e ./README.md` can be used on the command line
- valid commands can be used as arguments to if statements without syntax `if grep "boot" ./README.md; then`

- all variables should be quoted, `"$name"` just incase they contain spaces and are passed in as multiple arguments
        + `name="firstname Sername"; $name` would be passed as 2 arguments ( "firstname", "sername") if unquoted
- `&&` can be used to run code only if the first is successful. `funct1 && funct2` if funct1 fails, funct2 wont start exicution
- `||` can be used to run one function or another. `funct1 || funct2` if funct1 fails funct 2 will be run instead

#### example of dict in bash: associative array

```
declare -A example_arr     # decalres a variable with attributes, eg associative array
example_arr[key1]="value1"
example_arr[key2]="value2"
example_arr[key3]="value3"

# OR

declare -A example_arr=( [key1]="value1" [key2]="value2" [key3]="value3" )
```
```
# prints key:value pairs: DOESN'T MAINTAIN INDEX ORDER due to the key being stored as a hash value under the hood
for key in ${!example_arr[@]}; do
    echo "$key: ${example_arr[$key]}"
done
```

### Random Numbers in Bash

The `$RANDOM` is a special variable that will generate a new random number each time its called `echo $RANDOM`

Use a range: example: prints a number `>= 5` and `< 10`

```
# this can be made into a function
min=5
max=10

echo $(($RANDOM % ($max - $min) + $min))
```

[Add seed to RANDOM](https://unix.stackexchange.com/questions/405313/bash-random-with-seed)

**Once a number is generated, you can pull the last digits using**: 

```
(( 32767 % 10 ))    # 7     get last number
(( 32767 % 100 ))   # 67    get last 2 numbers
(( 32767 % 1000 ))  # 767   get last 3 numbers
```

---

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
