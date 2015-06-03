reset
set term pdf font "EB Garamond,15" size 6,3
set out "experience.pdf"

set label 1 "Experience" at graph 0.5, 0.5 center offset -2,0 rotate by 90

set yr [0:10]
set xr [-10:10]

set key below
set zeroaxis

set noborder

set xtic ("Dislike" -9, "Preference" 0, "Like" 9)
set xtic nomirror scale 0
unset ytic
set arrow 1 from 0, 0 to 10, 0
set arrow 2 from 0, 0 to -10, 0 nohead
set arrow 3 from 0, 0 to 0, 10

ps = 0.6

fn = "experience.dat"

plot \
fn u 1:2 i 0 w p tit "Computer languages" pt 5  lc 1 ps ps,\
"" u 1:2 i 1 w p tit "Human languages"    pt 7  lc 2 ps ps,\
"" u 1:2 i 2 w p tit "VCSs"               pt 9  lc 3 ps ps,\
"" u 1:2 i 3 w p tit "Misc"               pt 11 lc 4 ps ps,\
"" u 1:2 i 4 w p tit "OSs"                pt 13 lc 5 ps ps,\
for [i=0:4] "" u 1:2:3 i i w labels left  offset 0,0.4 notit


set out
set term pop
