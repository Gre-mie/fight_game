# Functions to help with debugging and testing

# Clears and overwrites log.txt starting a new session, creates the file if it doesn't exist
# Logs should follow the following format: <date/time> <message status>: <message> 
# Types of message status
    # INFO:
    # ERROR:

date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
printf "${date_time}INFO: log.txt cleared\n" > log.txt


log() { # args: string -> void
    date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
    printf "$date_time$1\n" >> log.txt
}


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
