#!/bin/bash

STAT_FILE=$1
TITLE=$2

if [ "$#" -lt  "2" ]; then
	echo -e "Usage: \n\t $0 stats_file graph_title"
	exit 1
elif ! [ -e $STAT_FILE ]; then
	echo "$1 does not exist"
	exit 1
elif ! [ -f $STAT_FILE ]; then
	echo "$1 is not a readable file"
	exit 1
fi

EXTENSION=".png"

gnuplot <<- EOF

	# line styles for ColorBrewer Dark2
	# for use with qualitative/categorical data
	# provides 8 dark colors based on Set2
	# compatible with gnuplot >=4.2
	# author: Anna Schneider

	# line styles
	set style line 1 lt 1 lc rgb '#1B9E77' # dark teal
	set style line 2 lt 1 lc rgb '#D95F02' # dark orange
	set style line 3 lt 1 lc rgb '#7570B3' # dark lilac
	set style line 4 lt 1 lc rgb '#E7298A' # dark magenta
	set style line 5 lt 1 lc rgb '#66A61E' # dark lime green
	set style line 6 lt 1 lc rgb '#E6AB02' # dark banana
	set style line 7 lt 1 lc rgb '#A6761D' # dark tan
	set style line 8 lt 1 lc rgb '#666666' # dark gray

	set style line 11 lt 2 pi -3 pt 4 lc rgb '#1B9E77' # dark teal
	set style line 12 lt 2 pi -3 pt 4 lc rgb '#D95F02' # dark orange
	set style line 13 lt 2 pi -3 pt 4 lc rgb '#7570B3' # dark lilac
	set style line 14 lt 2 pi -3 pt 4 lc rgb '#E7298A' # dark magenta
	set style line 15 lt 2 pi -3 pt 4 lc rgb '#66A61E' # dark lime green
	set style line 16 lt 2 pi -3 pt 4 lc rgb '#E6AB02' # dark banana
	set style line 17 lt 2 pi -3 pt 4 lc rgb '#A6761D' # dark tan
	set style line 18 lt 2 pi -3 pt 4 lc rgb '#666666' # dark gray

	# palette
	set palette maxcolors 8
	set palette defined ( 0 '#1B9E77',\
	1 '#D95F02',\
	2 '#7570B3',\
	3 '#E7298A',\
	4 '#66A61E',\
	5 '#E6AB02',\
	6 '#A6761D',\
	7 '#666666' )


	### Tics

	set xtics
	set ytics

	f(x) = x*100
	set term png
    set xlabel "Age"
    set ylabel "Errors over total samples"
    set title "${TITLE}"
    set key off
	set style fill solid
    set output "${STAT_FILE}_error_${EXTENSION}"
    plot '${STAT_FILE}' using 1:2 with boxes ls 3
    set ylabel "ECM"
    set output "${STAT_FILE}_ecm_${EXTENSION}"
    plot '${STAT_FILE}' using 1:3 with boxes ls 11
EOF