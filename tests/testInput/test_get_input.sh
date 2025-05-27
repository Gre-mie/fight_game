# tests for get_input funciton

. ./functs/game_functions.sh

# vars to be returned in a string
test_funct="testing: get_input"
test_pass=0
test_fail=0

exit_code=$?

return_str=("${test_funct}: pass: ${test_pass}  fail: ${test_fail}")


test_title="test no args"
get_input 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    ((test_pass++))
fi
printf "${test_title}\n"


test_title="test 3 args"
get_input one two three 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    printf "${col_pass}"
fi
printf "${test_title}\n"


test_title="test 1st arg!=int"
get_input abc 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    printf "${col_pass}"
fi
printf "${test_title}\n"


test_title="test both args=int"
get_input 12 444 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    printf "${col_pass}"
fi
printf "${test_title}\n"


test_title="test 1st arg=int 2nd arg=invalid str"
get_input 12 Bob 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    printf "${col_pass}"
fi
printf "${test_title}\n"


test_title="test 1st arg=int 2nd arg=invalid char"
get_input 12 Bo@ 2> err.log
if [[ $exit_code -ne 0 ]]; then
    printf "${col_fail}"
else
    printf "${col_pass}"
fi
printf "${test_title}\n"