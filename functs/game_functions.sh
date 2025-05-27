# contains functions for game logic and formatting

# Draws to the screen
draw() {
    clear
    printf "frame: ${frame}\n"
    sleep 0.25
}

# gets input from user
get_input() {
    local input
    read input

    printf "${#input}\n"

    echo "$input"
}