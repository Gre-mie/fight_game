# switch to main branch to pull last release from logs, switch to a branch that branches from that commit

# git switch main

# find the last release
git log --oneline | grep "Update" > ./temp/log.txt # using "Update" for testing, actual search: "Release v"
last_release=$(head -n 1 "./temp/log.txt")

if [[ -z ${last_release} ]]; then
    printf "\033[33mERROR:\033[39m could not find Release log\n"
    exit 1
fi
last_release_hash="${last_release:0:7}"
last_release_message="${last_release:8}"




printf "release: $last_release\nhash: $last_release_hash\nmessage: $last_release_message\n"


