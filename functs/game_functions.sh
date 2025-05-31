# contains functions for game logic and formatting

# Draws to the screen
draw() {
    clear
    printf "frame: ${frame}\n"
    sleep 0.25
}

# logic to simulate a battle between player and current enemy
# changes global player/enemy stats according to player/enemy options
# returns playerDead | enemyDead | ""
game_battle() {
    printf "game_battle $1 $2\n"
    echo ""
}