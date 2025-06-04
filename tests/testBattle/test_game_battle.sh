# Template for tests
    # copy to: ./tests/<directory>

. ./functs/game_functions.sh

# set player varaibles
player_name="TestPlayer"
player_health=100
player_defence=5
player_power=10

# set initial enemy varaibles
enemy_type="TestEnemy"
enemy_health=20
enemy_defence=5
enemy_power=10

test_game_battle() {


# vars to be returned in a string
test_funct="testing: game_battle"
test_pass=0
test_fail=0
# all failed tests go into the return_status in format: col_fail test_title
test_return_status=("") # starting the list with an empty string solves spacing issue


test_title="test enemy defend, player defend"       # D D

# set options
player_option=2
enemy_option=2

game_battle

if [[ $player_health -eq 100 && $enemy_health -eq 20 ]]; then
    ((test_pass++))
else
    ((test_fail++))
    test_return_status+=("${col_fail}${test_title}\n")
fi


echo "    ${test_funct}\n--- pass: ${test_pass}  fail: ${test_fail} ---\n${test_return_status[@]}\n"
}


# exicute all tests in the file
final_arr=$(test_game_battle)
printf "${final_arr}"
