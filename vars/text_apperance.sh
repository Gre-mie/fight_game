# Loads vairbles that change text colour and appearence

# text colours
# these colours should work in most terminals
# \033[0m resets the colours and modes before seting another colour or mode
game_text_default="\033[0;40;39m"
game_text_white="\033[0;40;39m"
game_text_grey="\033[0;40;37;2m"
game_text_dark_red="\033[0;40;31;2m"
game_text_red="\033[0;40;31m"
game_text_pink="\033[0;40;95m"
game_text_purple="\033[0;40;35m"
game_text_dark_yellow="\033[0;40;33;2m"
game_text_yellow="\033[0;40;33m"
game_text_dark_green="\033[0;40;92;2m"
game_text_green="\033[0;40;92m"
game_text_blue="\033[0;40;34m"
game_text_light_blue="\033[0;40;94m"


# Error and debug colours 
# text colour only, does not ser/reset anything else
err_x_col=""
err_highlight_col=""
err_text_col=""


# text apperance
# VScode ignores blinking text
game_text_blink="\033[5m"
