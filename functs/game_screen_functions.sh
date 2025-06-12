# All functions that relate to directly printing to the terminal screen view
# NOTE: Terminals start at line/col 1 NOT 0 

. ./vars/global_vars.sh
. ./vars/text_apperance.sh


# clears an area


# prints text starting from col, line
display_text() { # args: line col text
    if [[ $# -lt 3 ]]; then
        log "ERROR: not enough arguments for display_text"
        printf "\033[33mERROR:\033[39m $# arguments given, display_text(line, col, text)\n"
        exit 1
    fi
    
    printf "\033[%d;%dH" "$1" "$2"
    printf "$3"

}


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
vertical_line() { # args: column start_line num_of_chars
    if [[ $# -lt 3 ]]; then
        log "ERROR: not enough arguments for vertical_line"
        printf "\033[33mERROR:\033[39m $# arguments given, vertical_line(column, start_line, num_of_chars)\n"
        exit 1
    fi

    for ((i=$2; i <= $3; i++)); do
        printf "\033[%d;%dH" "$i" "$1"
        printf "|"
    done

}


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

    # print vertical lines: on column x, from line x, line len x chars
    vertical_line 1 2 $gamescreen_min_height
    vertical_line 38 13 19
    vertical_line 59 2 $gamescreen_min_height

    # print text starting at: line x, column x
    display_text 2 3 "Rooms"
    local calc_area_from_end=$((${#game_version} + 1))
    local calc_char_position=$(($gamescreen_min_width - $calc_area_from_end))
    display_text 2 $calc_char_position "${game_version}"
    display_text 13 3 "Battle Log"
    display_text 13 40 "Player Stats "
    
    # print options in options area from an array
    # print zero option
    display_text 20 3 "Options:"
    local calc_area_from_end=$((${#player_options_arr[0]} + 1))
    local calc_char_position=$(($gamescreen_min_width - $calc_area_from_end))
    display_text 20 $calc_char_position "${player_options_arr[0]}"

    # print all other options
    # use two spaces between options to make it easier to read
    local print_at_col=13
    for ((i=1; i < ${#player_options_arr[@]}; i++)); do
        display_text 20 $print_at_col "${player_options_arr[$i]}"
        print_at_col=$(($print_at_col + ${#player_options_arr[$i]}))
        print_at_col=$(($print_at_col + 2))
    done






    # TODO: show curser
}