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

# Game Screen

```
0   1...5....1....5....2....5....3....5....4....5....5....5....6
1    _________________________________________________________
2   | rooms				               v0.2.1 |
3   |   1         2         3         4         5         6   |  
4   |   |_________|_________|_________|_________|_________|   |
5   |_________________________________________________________|
6   |                                                         |
7   |              |  --                    --  |             |
8   | Player name  |   |                    |   |  Enemy name |
9   |   action     |  (|                    |)  |    action   |
10  |             ---  |                    |  ---            |
11  |              |  --                    --  |             |
12  |_________________________________________________________|
13  | Battle Log                         | player stats       |
14  |                                    |                    |
15  | Player attacks                     | Health         100 |
16  | Enemy took 10 damage               | defence        5   |
17  | Enemy attacks                      | Power          10  |
18  | Player took 10 damage              |                    |
19  |____________________________________|____________________|
20  | Options:  1 Attack     2 Defend                  0 Exit |
21  |                                                         |
22  | Choose an option $                                      |
23  |_________________________________________________________|

Min terminal size:   59 width    23 height


Animations

enemy defend
player defend
enemy attack
player attack

sword swing
5   |_________________________________________________________|
6   |                                                         |
7   |              |                        --                |
8   | Player name  |      /                 |      Enemy name |
9   |   action     |     /                  |)       action   |
10  |             ---  \/                   |                 |
11  |              |   /\    --|------      --                |
12  |_________________________________________________________|


player seen errors

19  |____________________________________|____________________|
20  | Options:  1 Attack     2 Defend                  0 Exit |
21  | Incorrect input <a-Z>                                   |
22  | Choose a name $                                         |
23  |_________________________________________________________|

19  |____________________________________|____________________|
20  | Options:  1 Attack     2 Defend                  0 Exit |
21  | Incorrect input <0-2>                                   |
22  | Choose an option $                                      |
23  |_________________________________________________________|

game end screens

Player Win

0   0...5....1....5....2....5....3....5....4....5....5....5....6
1    _________________________________________________________
2   | rooms						      |
3   |   1         2         3         4         5         6   |  
4   |   |_________|_________|_________|_________|_________|   |
5   |_________________________________________________________|
6   |                                                         |
7   | 			    YOU WIN :D                        |
8   |                                                         |
9   |   Rooms completed    2                                  |
10  |   Enemies defeated   7                                  |
11  |   Items used         2                                  |
12  |   Remaining health   75                                 |
13  |                                                         |
14  |                    Final score: 23                      |
15  |_________________________________________________________|
16  
17  $ 

Player Loose

0   0...5....1....5....2....5....3....5....4....5....5....5....6
1    _________________________________________________________
2   | rooms						      |
3   |   1         2         3         4         5         6   |  
4   |   |_________|_________|_________|_________|_________|   |
5   |_________________________________________________________|
6   |                                                         |
7   | 			    YOU Died :(                       |
8   |                                                         |
9   |   Rooms completed    0                                  |
10  |   Enemies defeated   0                                  |
11  |   Items used         0                                  |
12  |   Remaining health   0                                  |
13  |                                                         |
14  |                    Final score: -5                      |
15  |_________________________________________________________|
16  
17  $ 

Player Exits early

0   0...5....1....5....2....5....3....5....4....5....5....5....6
1    _________________________________________________________
2   | rooms						      |
3   |   1         2         3         4         5         6   |  
4   |   |_________|_________|_________|_________|_________|   |
5   |_________________________________________________________|
6   |                                                         |
7   | 			    Exiting Game :/                   |
8   |                                                         |
9   |   Rooms completed    2                                  |
10  |   Enemies defeated   7                                  |
11  |   Items used         2                                  |
12  |   Remaining health   75                                 |
13  |                                                         |
14  |                    Final score: 23                      |
15  |_________________________________________________________|
16  
17  $ 

Battle log

Enemy vanquished

12  |_________________________________________________________|
13  | Battle Log                         | player stats       |
14  |                                    |                    |
15  | Player attacks                     | Health         100 |
16  | Enemy took 10 damage               | defence        5   |
17  | 	                                 | Power          10  |
18  | Enemy has been slain               |                    |
19  |____________________________________|____________________|
```
