#!/bin/bash

# load necessary files globally
. $(find ./functs/debug -name "log.sh")
. $(find ./functs/paths -name "is_path.sh")

# This script is the entry point for the game
set -e

# set common paths to globals
player_file_path=$(find ./vars -name "player.sh")

if [[ $(is_path "$player_file_path" == false) ]]; then # !!!! Continue here !!!!!
    log "ERROR: critical game file unable to load"
    exit 1
fi

# Game setup logic
setup() {   # args: void -> void  # could take an array of things to load if they get to many
    log "INFO: Start game setup..."
    
    printf "player: $player_name\nhealth: $player_health"

    log "INFO: Setup complete"
}

# Updates the frame
update() { # args: int -> void
    printf "frame: $1\n"        # TODO: add game logic
                                # TODO: take player input from option, one char
                                # TODO: generate random number and have enemy pick option from list
}

# Prints the game to the console
draw() {
    clear
    printf "printing... $player_name\n"      # TODO: print game screen, use width and heigh built in variables
                                # ==================================
                                # game stuff
                                # ==================================

}

# runs the game
main() {
    setup   # loads varibles from a file inside the main funciton scope
    log "INFO: Game running..."

    local frame=0
    local running=true
    while $running; do 
        frame=$(($frame+1))


        # temp code vv
        if [[ $frame -gt 10 ]]; then  
            running=false  
            log "INFO: Game stopped, ran for $frame frames"
            exit 0
        fi
        #sleep 0.5 # seconds
        # temp code ^^


        #update $frame
        #draw
    done
}
main
