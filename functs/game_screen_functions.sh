# All functions that relate to directly printing to the terminal screen view

. ./vars/global_vars.sh
. ./vars/text_apperance.sh

print_border() {
    printf "\033[2J"                  # clear screen
    printf "\033[H"                 # move curser to home 0.0

    # creates a line across the terminal
    local line_score=""
    for ((i=0; i < $gamescreen_min_width ; i++)); do
        line_score="${line_score}_"
    done

    printf "$line_score"



    sleep 0.25
}