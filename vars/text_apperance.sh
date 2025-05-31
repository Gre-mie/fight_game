# Loads vairbles that change text colour and appearence

# text colours
# these colours should work in most terminals
# \033[0m resets the colours and modes before seting another colour or mode
game_text_default="\033[0;39m"
game_text_grey="\033[0;37;2m"
game_text_red="\033[0;31m"
game_text_pink="\033[0;95m"
game_text_yellow="\033[0;33m"
game_text_green="\033[0;92m"
game_text_blue="\033[0;34m"

# set terminal to game_col_default
printf "${game_text_default}"

# text apperance
# VScode ignores blinking text
game_text_blink="\033[5m"
