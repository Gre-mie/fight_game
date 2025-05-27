# tests for get_input funciton

. ./functs/game_functions.sh

test_get_input() {


# vars to be returned in a string
test_funct="testing: get_input"
test_pass=0
test_fail=0
exit_code=$?
test_return_status=("") # starting the list with an empty string solves spacing issue


test_title="test no args"
get_input 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi


test_title="test 3 args"
get_input one two three 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi


test_title="test 1st arg!=int"
get_input abc 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi


test_title="test both args=int"
get_input 12 444 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi


test_title="test 1st arg=int 2nd arg=invalid str"
get_input 12 Bob 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi


test_title="test 1st arg=int 2nd arg=invalid char"
get_input 12 Bo@ 2> err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
else
    ((test_pass++))
fi

echo "    ${test_funct}\n--- pass: ${test_pass}  fail: ${test_fail} ---\n${test_return_status[@]}\n"
}


final_arr=$(test_get_input)
printf "${final_arr}"
