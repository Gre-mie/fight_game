# check if path exists or raise error and end programme
is_path() { # args: string -> bool
    if [[ -e "$1" ]]; then
        echo true
    else
        if [[ $1 == "" ]]; then                     # TODO: add colour to errors might be better done in log.sh
            log "WARNING: path is an empty string, path not found"
            echo false
        else
            log "WARNING: $1 not found"
            echo false
        fi
    fi
}
