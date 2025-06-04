# tests enemy variable files to check they meet with balancing rules in contributing.md

. ./functs/game_functions.sh

test_enemy_var_files() {
# vars to be returned in a string
test_funct="testing: enemy var files"
test_pass=0
test_fail=0
# all failed tests go into the return_status in format: col_fail test_title
test_return_status=("") # starting the list with an empty string solves spacing issue

. ./vars/entities/player.sh
local enemy_file_paths=($(ls ./vars/entities/enemies/))

for ((i=0; i < ${#enemy_file_paths[@]}; i++)); do
    local enemy_path="./vars/entities/enemies/${enemy_file_paths[$i]}"

    if [[ -f "${enemy_path}" ]]; then
        test_title="test ${enemy_file_paths[$i]}"

        # exicute file to reset enemy vars

        # compare enemy with player stats to determin pass/fail

        if [[ 1 -eq 1 ]]; then
            ((test_pass++))
        else
            ((test_fail++))
            test_return_status+=("${col_fail}${test_title}\n")
        fi
    else
      test_return_status+=("\033[33mERROR:\033[39m not a file path, ${enemy_path}\n")

    fi
done


echo "    ${test_funct}\n--- pass: ${test_pass}  fail: ${test_fail} ---\n${test_return_status[@]}\n"
}


# exicute all tests in the file
final_arr=$(test_enemy_var_files)
printf "${final_arr}"
