#!/bin/bash

# load necessary files globally
. $(find ./ -name "log.sh")
. $(find ./ -name "is_path.sh")

# This script will exicute tests within the tests/ directory
set -e

run_tests() { # args: string | void -> void
    local path="./tests"
    # reset path if argument is given
    if [[ $1 ]]; then
        path="$1"
    fi
    is_path "$path"

    # if argument is a file and starts with "test" will attempt to exicute the file
    # files that are not .sh but start with "test" will cause a "command not found" error
    if [[ -f "$path" && "$path" =~ ^test ]]; then
        . "$path"
    fi

    local sub_dirs=($(ls "$path"))

    # DFS to exicute all the files in the direcotry
    for segment in "${sub_dirs[@]}"; do
        # detects items that start with "test" adds "/" if not present at the end of the path
        if [[ $segment =~ ^test ]]; then
            if [[ ! $path =~ /$ ]]; then
                path="$path/"
            fi
            local current_path="${path}${segment}"

            # detects type of segment
            if [[ -f "$current_path" ]]; then
                is_path "${current_path}"
                . "${current_path}"
            elif [[ -d $current_path ]]; then
                run_tests "${current_path}"
            fi
        fi
    done
}

run_tests "$1"
