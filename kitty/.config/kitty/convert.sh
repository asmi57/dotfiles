#!/bin/env sh

# background #1E1E2E -> #282828
# foreground #CDD6F4 -> #EBDBB2
# color0  #45475A -> #3C3836
# color1  #F38BA8 -> #CC241D
# color2  #A6E3A1 -> #98971A
# color3  #F9E2AF -> #D79921
# color4  #89B4FA -> #458588
# color5  #F5C2E7 -> #B16286
# color6  #94E2D5 -> #689D6A
# color7  #BAC2DE -> #A89984
# color8  #585B70 -> #928374
# color9  #F38BA8 -> #FB4934
# color10 #A6E3A1 -> #B8BB26
# color11 #F9E2AF -> #FABD2F
# color12 #89B4FA -> #83A598
# color13 #F5C2E7 -> #D3869B
# color14 #94E2D5 -> #8EC07C
# color15 #A6ADC8 -> #FBF1C7
# 
# cursor #F5E0DC -> #BDAE93
# cursor_text_color #1E1E2E -> #665C54
# 
# url_color #F5E0DC -> #458588


cat $1 |
sed 's/#1E1E2E/#282828/g' |
sed 's/#CDD6F4/#EBDBB2/g' |
sed 's/#45475A/#3C3836/g' |
sed 's/#F38BA8/#CC241D/g' |
sed 's/#A6E3A1/#98971A/g' |
sed 's/#F9E2AF/#D79921/g' |
sed 's/#89B4FA/#458588/g' |
sed 's/#F5C2E7/#B16286/g' |
sed 's/#94E2D5/#689D6A/g' |
sed 's/#BAC2DE/#A89984/g' |
sed 's/#585B70/#928374/g' |
sed 's/#F38BA8/#FB4934/g' |
sed 's/#A6E3A1/#B8BB26/g' |
sed 's/#F9E2AF/#FABD2F/g' |
sed 's/#89B4FA/#83A598/g' |
sed 's/#F5C2E7/#D3869B/g' |
sed 's/#94E2D5/#8EC07C/g' |
sed 's/#A6ADC8/#FBF1C7/g' |
sed 's/#F5E0DC/#BDAE93/g' |
sed 's/#1E1E2E/#665C54/g' |
sed 's/#F5E0DC/#458588/g'
