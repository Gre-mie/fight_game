# tests for get_input funciton

. ./functs/input_functions.sh

test_get_input() {


# vars to be returned in a string
test_funct="testing: get_input"
test_pass=0
test_fail=0
exit_code=$?
# array that holds failing tests to be returned to the caller
test_return_status=("") # starting the list with an empty string solves spacing issue


test_title="test no args"
get_input 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi


test_title="test 3 args"
get_input one two three 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi


test_title="test 1st arg!=int"
get_input abc 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi


test_title="test both args=int"
get_input 12 444 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi


test_title="test 1st arg=int 2nd arg=invalid str"
get_input 12 Bob 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi


test_title="test 1st arg=int 2nd arg=invalid char"
get_input 12 Bo@ 2> ./temp/err.log
exit_code=$?
if [[ $exit_code == 0 ]]; then
    test_return_status+=("${col_fail}${test_title}\n")
    ((test_fail++))
else
    ((test_pass++))
fi

echo "    ${test_funct}\n--- pass: ${test_pass}  fail: ${test_fail} ---\n${test_return_status[@]}\n"
}


# exicute all tests in the file
final_arr=$(test_get_input)
printf "${final_arr}"
