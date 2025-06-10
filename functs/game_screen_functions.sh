# All functions that relate to directly printing to the terminal screen view
# NOTE: Terminals start at line/col 1 NOT 0 

. ./vars/global_vars.sh
. ./vars/text_apperance.sh


# clears an area


# prints text starting from col, line


# prints a horizontal line
horizontal_line() { # args: line start_col num_of_chars
    if [[ $# -lt 3 ]]; then
        log "ERROR: not enough arguments for horizontal_line"
        printf "\033[33mERROR:\033[39m $# arguments given, horizontal_line(line, start_col, num_of_chars)\n"
        exit 1
    fi

    printf "\033[%d;%dH" "$1" "$2"
    for ((i=$2; i <= $3; i++)); do
        printf "_"
    done

}


# prints a vertical line


# prints the starting border for the game UI
# lines are over written, so no need to calcluate for intersecting lines
print_border() {
                                    # TODO: hide curser
    printf "\033[2J"                # clear screen
    printf "\033[H"                 # move curser to home 0.0


    # print horizontal lines: on line x, from col x, line len x chars
    horizontal_line 1 1 $gamescreen_min_width
    horizontal_line 5 1 $gamescreen_min_width
    horizontal_line 12 1 $gamescreen_min_width
    horizontal_line 19 1 $gamescreen_min_width
    horizontal_line 23 1 $gamescreen_min_width

    printf "\033[H"






}