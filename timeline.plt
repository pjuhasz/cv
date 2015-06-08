# TODO
# newline spacing ???
# bullet pts for descr ?
# marks for work & education (column in data file, unicode symbol in plot)

reset
set term pdf font "EB Garamond,15" butt size 5.8, 4
set out "timeline.pdf"

fn = "timeline.dat"

start_date = 2000
end_date   = 2015.9
tics = "2000 2007 2012"

start_x = -5
end_x = 15

axis_color = "black"

job_title_pos    = -1
company_pos      =  1
location_pos     = 10
description_pos  =  1

font_offset      = 0.18
box_hi           = 0.5
box_low          = -1.25

idx_mul = 3

set xr [start_x:end_x]
set yzeroaxis lt 1 lc rgb axis_color
set ytics axis scale 0.5 offset 0, font_offset
set ytics format ""
set ytics 1
unset mytics
do for [tic in tics] {
	set ytics add (tic int(tic))
}
unset xtics
set border lt 1 lc rgb axis_color
unse border
set yr [start_date:end_date]
unset key
set style fill transparent solid 0.2 noborder

boxc_grey   = 160
boxc_fac    = 0.2

atcolor(c)  = ((boxc_grey + int(((int(c) & 0xff0000) >> 16)*boxc_fac))<<16) \
            + ((boxc_grey + int(((int(c) & 0x00ff00) >>  8)*boxc_fac))<< 8) \
            + ( boxc_grey + int(((int(c) & 0x0000ff)       *boxc_fac)))


plot \
	fn u (0):3:(start_x):(end_x):($3+box_hi):($3+box_low) w boxxy lc rgb "black",\
	fn u (0):3:(start_x):(end_x):($3+box_hi):($3+box_low):8 w boxxy lc rgb var,\
	fn u (0):1:(0):($2-$1):8 w vector nohead lc rgb var lw 8,\
	fn u (0):3:(atcolor($8)) w p pt 7 lc rgb var ps 1.5,\
	fn u (0):($3+font_offset) w p pt "@",\
	fn u (job_title_pos):($3+font_offset):4 w labels right,\
	fn u (company_pos):($3+font_offset):5 w labels left,\
	fn u (location_pos):($3+font_offset):6 w labels left,\
	fn u (description_pos):($3+font_offset):("\n\n".strcol(7)) w labels left


set out
set term pop
