#!/bin/bash

# This script will exicute tests within the tests/ directory
set -e

tests() {
    local start="./tests"
    if [[ $1 ]]; then
        start="$1"
    fi

    if [[ -e "$start" ]]; then
        printf "file $start exists\n"                 # TODO: send success messege to log
    else
                                                    # TODO: send error messege to log (no colour)
        trap "Error: $start cannot be found" EER    # TODO: Fix this and add colour to errors if possible
    fi

}

tests "$1"