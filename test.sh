#!/bin/bash

# This script will exicute tests within the tests/ directory
set -e

tests() {
    local start="./tests"
    if [[ $1 ]]; then
        start="$1"
    fi

    if [[ -e "$start" ]]; then
        printf "file $start exists\n"               # TODO: send success messege to log
    else
                                                    # TODO: send error messege to log (no colour)
        printf "Error: $start not found\n" >&2      # TODO: add colour to errors
        exit 1
    fi

}

tests "$1"