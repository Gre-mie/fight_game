# check if path exists or raise error and end programme
is_path() {
    if [[ -e "$1" ]]; then
        return 0
    else
                                                # TODO: send error messege to log (no colour)
        printf "Error: $1 not found\n" >&2      # TODO: add colour to errors
        exit 1
    fi
}
