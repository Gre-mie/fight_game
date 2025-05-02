#!/bin/bash

# This script will exicute tests within the tests/ directory
set -e

tests() {
    local start="./tests"
    if [[ $1 ]]; then
        start="$1"
    fi
    
    printf "tests running from $start\n"
}

tests "$1"