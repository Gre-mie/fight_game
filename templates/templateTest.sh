# Template for tests
    # copy to: ./tests/<directory>

. ./functs/game_functions.sh

test_() {           # !!!! add function name being tested


# vars to be returned in a string
test_funct="testing: "      # !!!! add function name to be tested
test_pass=0
test_fail=0
# all failed tests go into the return_status in format: col_fail test_title
test_return_status=("") # starting the list with an empty string solves spacing issue


test_title=         # !!!! what the test does
# !!!! call function and save return or use 2> ./temp/err.log if checking for exit code
#if exit code or function returns unexpect result; then
 #   ((test_pass++))
#else
 #   ((test_fail++))
  #  test_return_status+=("${col_fail}${test_title}\n")
#fi


echo "    ${test_funct}\n--- pass: ${test_pass}  fail: ${test_fail} ---\n${test_return_status[@]}\n"
}


# exicute all tests in the file
final_arr=          # !!!! call tests
printf "${final_arr}"
