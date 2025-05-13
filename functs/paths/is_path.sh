# check if path exists or raise error and end programme
is_path() { # args: string -> status code
    if [[ -e "$1" ]]; then
        return 0
    else
        log "ERROR: $1 not found"
        printf "Error: $1 not found\n" >&2      # TODO: add colour to errors
        exit 1
    fi
}
