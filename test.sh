#!/bin/bash

# This script will exicute tests within the tests/ directory
set -e

tun_tests() {
    local path="./tests"
    # reset path if argument is given
    if [[ $1 ]]; then
        path="$1"
    fi

    # check if vaild path
    if [[ -e "$path" ]]; then
        printf "file $path exists\n"               # TODO: send success messege to log
    else
                                                    # TODO: send error messege to log (no colour)
        printf "Error: $path not found\n" >&2      # TODO: add colour to errors
        exit 1
    fi
    
    # gets list of sub directories
    # backs out of dir if no exicutable or dir
    local sub_dirs=$(ls "$path")
    printf "${#sub_dirs}\n" # TODO: this doesn't seem right, need an exit condition

    for item in "$sub_dirs"; do
        printf "$item\n"
        
    done
    pwd 

}

tun_tests "$1"