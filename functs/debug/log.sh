# Logs should follow the following format: <date/time> <message status>: <message> 
# Types of message status
    # INFO:     information about what is being run successfully
    # WARNING:  warning about something not happening as it should be
    # ERROR:    critical problem script should be stopped

# Clears and overwrites log.txt starting a new session, creates the file if it doesn't exist
date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
printf "${date_time}INFO: Logs cleared\n" > log.txt


log() { # args: string -> void
    date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
    printf "$date_time$1\n" >> log.txt
}
