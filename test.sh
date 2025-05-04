#!/bin/bash

. ./functs/paths/is_path.sh

# This script will exicute tests within the tests/ directory
set -e

run_tests() {
    local path="./tests"
    # reset path if argument is given
    if [[ $1 ]]; then
        path="$1"
    fi
    is_path "$1"
    
    # gets list of sub directories
    # backs out of dir if no exicutable or dir
    local sub_dirs=$(ls "$path")
    printf "${#sub_dirs}\n" # TODO: this doesn't seem right, need an exit condition

    for item in "$sub_dirs"; do
        printf "$item\n"
        
    done
    

}

run_tests "$1"