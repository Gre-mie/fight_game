# All functions that relate to directly printing to the terminal screen view
# NOTE: Terminals start at line/col 1 NOT 0 

. ./vars/global_vars.sh
. ./vars/text_apperance.sh


# clears an area
# x1 y1 = top left corner of area
# x2 y2 = bottom right corner of area inclusive
display_clear_area() { # args: x1 y1 x2 y2
    local current_x=$1
    local current_y=$2
    while [[ $current_y -le $4 ]]; do
        while [[ $current_x -le $3 ]]; do
            printf " "
            ((current_x++))
        done
        current_x=$1
        ((current_y++))
        printf "\n"
    done
}

# prints centered text within a horizontal area
center_text() { # args: collumn_start collumn_end text
    if [[ $# -lt 3 ]]; then
        printf "${err_msg_seg} not enough args: center_text(collumn_start collumn_end text)${reset_msg_seg}"
        exit 1
    fi
    collumn_start=$1
    collumn_end=$2
    text=$3
    center=$(($(($collumn_end + $collumn_start)) / 2))
    half_text=$((${#text} / 2))
    position=$(($center - $half_text))
    printf "\033[%dG${text}" "$position"
}

# prints text starting from col, line
display_text() { # args: line col text
    if [[ $# -lt 3 ]]; then
        log "ERROR: not enough arguments for display_text"
        printf "${err_msg_seg} $# arguments given, display_text($1, $2, $3)${reset_msg_seg}"
        exit 1
    fi
    printf "\033[%d;%dH" "$1" "$2"
    printf "$3"
}

# prints a horizontal line
horizontal_line() { # args: line start_col num_of_chars
    if [[ $# -lt 3 ]]; then
        log "ERROR: not enough arguments for horizontal_line"
        printf "${err_msg_seg} $# arguments given, horizontal_line(line, start_col, num_of_chars)${reset_msg_seg}"
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
        printf "${err_msg_seg} $# arguments given, vertical_line(column, start_line, num_of_chars)${reset_msg_seg}"
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
}

# print area functions
# updates and prints areas to the terminal
# print text starting at: line x, column x

print_room_area() {
    display_text 2 3 "Rooms"
    local calc_area_from_end=$((${#game_version} + 1))
    local calc_char_position=$(($gamescreen_min_width - $calc_area_from_end))
    display_text 2 $calc_char_position "${game_version}"
}

print_battle_log_area() {
    display_text 13 3 "Battle Log"
}

print_animation_area() {
    display_text 8 3 "${player_name}"   # names can be 20 chars long? 
                                        # TODO: 
                                            # calculate the area needed for animations
                                            # compare with the area left
                                            # change possible max len of name according to area left
                                            # possibly center the name
    # print coloured enemy name
    local start_num_print_position=$(($(($gamescreen_min_width-1))-${#enemy_type}))
    display_text 8 $start_num_print_position "${enemy_col}$enemy_type${game_text_default}"
}

print_stats_area() {
    display_text 13 40 "Player Stats "
    local stat_num_print_position=$(($gamescreen_min_width - 5))
    display_text 15 40 "Health"

    # colours the player health based on the percentage of player_max_health
    local coloured_health="$player_health"
    if [[ $player_health -lt $(($player_max_health / 4)) ]]; then
        coloured_health="${game_text_red}$player_health${game_text_default}"
    elif [[ $player_health -lt $(($player_max_health / 2)) ]]; then
        coloured_health="${game_text_yellow}$player_health${game_text_default}"
    else 
        coloured_health="${game_text_green}$player_health${game_text_default}"
    fi
    display_text 15 $stat_num_print_position "$coloured_health"
    
    display_text 16 40 "Defence"
    display_text 16 $stat_num_print_position "$player_defence"
    display_text 17 40 "Power"
    display_text 17 $stat_num_print_position "$player_power"
}

print_options_area() {
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
}
