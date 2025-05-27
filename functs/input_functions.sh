# functions to do with getting input from the user and validation

# gets input from user
get_input() {
    local input

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
            printf "$input"
            # check if input a valid string of ^[a-zA-Z]+$ return automatically at $1 chars

            return 0
        else
            echo "$error_message" >&2
            return 1
        fi
    fi

    read -n ${1} input
    printf "$input"
    # check if input a valid int (option from menu) return automatically after $1 chars
    # int should not supass the max number of options, eg 0 - len option list 
    # 0 option will be reserved for exiting the game


    return 0
}