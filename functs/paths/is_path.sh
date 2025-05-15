# check if path exists or raise error and end programme
is_path() { # args: string -> status code
    if [[ -e "$1" ]]; then
        return 0
    else
        if [[ $1 == "" ]]; then                                     # TODO: add colour to errors
            log "ERROR: path is an empty string, path not found"
        else
            log "ERROR: $1 not found"
        fi
    fi
}
