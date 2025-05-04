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
    is_path "$path"
    
    local sub_dirs=($(ls "$path"))

    # 
    for item in "${sub_dirs[@]}"; do
        # detects items that start with "test"
        if [[ $item =~ ^test ]]; then
           printf "Valid: $item\n"
        fi

    done
    

}

run_tests "$1"