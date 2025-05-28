# functions to do with getting input from the user and validation

# gets input from user
# two types of input can be returned
    # if 'string' is present as the second option, the int represents the max num of chars before automatic return
        # get_input <int> string
            # returns a string
    # if there is no second option, the int represents the number of items in an array
        # get_input <int>
            # returns a number from 0-((int-1))
get_input() {
    local input
    local x_marker="\033[31mX \033[39m"

    # checks for correct number arguments
    local error_message="ERROR: incorrect arguemnts, get_input int ['string']"
    if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "$error_message" >&2
        return 1
    fi

    # check first arg is an int
    if ! [[ $1 =~ ^[0-9]+$ ]]; then
        echo "$error_message" >&2
        return 1
    fi

    # check for second arg and if exists check is valid argument
    if [[ $# == 2 ]]; then
        if [[ $2 =~ "string" ]]; then

            read -n ${1} input
            # continually asks user for input until a valid string is given 
                # automatically returns when it reaches $1 chars read
                # a valid string is a-zA-Z 
                # unable to get space matching to work
            while ! [[ "$input" =~ ^[a-zA-Z]+$ ]]; do
                log "WARNING: Invalid input '${input}', requires string a-z A-Z"
                # >&2 is used to force the print to happen imediatly instead of waiting for the output stream buffer to be full
                printf "${x_marker} Invalid input, not a-Z $ " >&2 
                read -n ${1} input
            done
            echo "${input}"
            return 0
        else
            echo "$error_message" >&2
            return 1
        fi
    fi

    read input
    # check if input a valid int (option from menu) return automatically after $1 chars
    # int should not supass the max number of options, eg 0 - len option list 
    # 0 option will be reserved for exiting the game
    local max_option=$1
    ((max_option--))
    while [[ ! "$input" =~ ^[0-9]+$ || "$input" -lt 0 || "$input" -ge ${1} ]]; do
        log "WARNING: Invalid input '${input}', requires int 0-${1}"
        # >&2 is used to force the print to happen imediatly instead of waiting for the output stream buffer to be full
        printf "${x_marker} Invalid input, not 0-${max_option} " >&2 
        read input
    done

    echo "$input"
    return 0
}