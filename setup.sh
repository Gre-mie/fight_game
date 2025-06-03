# switch to main branch to pull last release from logs, switch to a branch that branches from that commit

#git switch main

# find the last release
git log --oneline | grep "Release" > ./temp/log.txt # using "Update" for testing, actual search: "Release v"
last_release=$(head -n 1 "./temp/log.txt")

if [[ -z ${last_release} ]]; then
    printf "\033[33mERROR:\033[39m couldn't find Release log\n"
    exit 1
fi
last_release_hash="${last_release:0:7}"
last_release_message="${last_release:8}"

if [[ "${last_release_message}" =~ v[0-9].[0-9].[0-9] ]]; then 
    release_branch_name="release_${BASH_REMATCH}" # BASH_REMATCH is a built in bash variable that saves matches of a regex
else
    printf "033\[33mERROR:\033[39m couldn't find valid release log\n"
    exit 1
fi

# checks a realease branch name exists
if [[ -z $release_branch_name ]]; then
    printf "033\[33mERROR:\033[39m couldn't find valid release log\n"
    exit 1
fi

# switch to last release branch
if [[ -z $(git branch | grep "${release_branch_name}") ]]; then
    printf "branch not found, need to create one\n"
    git switch -c "${release_branch_name}" "${last_release_hash}"
else
    git switch "${release_branch_name}"
fi
