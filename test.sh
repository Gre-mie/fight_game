#!/bin/bash

# This script will exicute tests within the tests/ directory
set -e

tests() {
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
    local sub_dirs=$(ls "$path")
    for item in "$sub_dirs"; do
        printf "$item\n"
    done

}

tests "$1"