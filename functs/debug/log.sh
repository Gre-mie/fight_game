# Log should follow the following format: <date/time> <message status>: <message> 
# Types of message status
    # INFO:
    # ERROR:

# Clears and overwrites log.txt starting a new session, creates the file if it doesn't already exist
date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
printf "${date_time}INFO: log.txt cleared\n" > log.txt


log() { # args: string -> void
    date_time=$(date "+%Y-%m-%d %H:%M:%S\t")
    printf "$date_time$1\n" >> log.txt
}