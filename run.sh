#!/bin/bash

set -u

declare -A example_arr=( [key1]="value1" [key2]="value2" [key3]="value3" )

for key in ${!example_arr[@]}; do
    echo "$key: ${example_arr[$key]}"
done