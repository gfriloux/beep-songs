#!/bin/bash
#####################################################################
# File : play.sh
#-------------------
#
# Author : Arnaud Calmettes
#
# Reads a music sheet (txt file) and plays it on the pc speaker
# This script requires the "beep" program
#

######################################################################
# Note/Frequency correspondances  :  NOTE[octave]=Freq
#
# NOTE_ stands for the "sharp" note
# _ 		alone stands for a silence
#

DO[0]=16.35
DO_[0]=17.32
RE[0]=18.35
RE_[0]=19.45
MI[0]=20.60
FA[0]=21.83
FA_[0]=23.12
SOL[0]=24.50
SOL_[0]=25.96
LA[0]=27.50
LA_[0]=29.14
SI[0]=30.87

DO[1]=32.70
DO_[1]=34.65
RE[1]=36.71
RE_[1]=38.89
MI[1]=41.2
FA[1]=43.65
FA_[1]=46.25
SOL[1]=49
SOL_[1]=51.91
LA[1]=55
LA_[1]=58.27
SI[1]=61.74

DO[2]=65.41
DO_[2]=69.30
RE[2]=73.42
RE_[2]=77.78
MI[2]=82.41
FA[2]=87.31
FA_[2]=92.5
SOL[2]=98
SOL_[2]=103.83
LA[2]=110
LA_[2]=116.54
SI[2]=123.47

DO[3]=130.81
DO_[3]=138.59
RE[3]=146.83
RE_[3]=155.56
MI[3]=164.81
FA[3]=174.61
FA_[3]=185
SOL[3]=196
SOL_[3]=207.65
LA[3]=220
LA_[3]=233.08
SI[3]=246.94

DO[4]=261.66
DO_[4]=277.18
RE[4]=293.664
RE_[4]=311.126
MI[4]=329.627
FA[4]=349.228
FA_[4]=369.994
SOL[4]=391.995
SOL_[4]=415.304
LA[4]=440
LA_[4]=466.163
SI[4]=493.883

DO[5]=523.25
DO_[5]=554.37
RE[5]=587.329
RE_[5]=622.253
MI[5]=659.255
FA[5]=698.456
FA_[5]=739.988
SOL[5]=783.991
SOL_[5]=830.609
LA[5]=880
LA_[5]=932.327
SI[5]=987.766

DO[6]=1046.50
DO_[6]=1108.73
RE[6]=1174.059
RE_[6]=1244.507
MI[6]=1318.510
FA[6]=1396.912
FA_[6]=1479.976
SOL[6]=1567.982
SOL_[6]=1661.218
LA[6]=1760
LA_[6]=1864.654
SI[6]=1975.532


DO[7]=2093
DO_[7]=2217.46
RE[7]=2344.318
RE_[7]=2489.014
MI[7]=2637.02
FA[7]=2793.824
FA_[7]=2959.952
SOL[7]=3135.964
SOL_[7]=3322.436
LA[7]=3520
LA_[7]=3729.308
SI[7]=3951.064

DO[8]=4186.01
DO_[8]=4434.92
RE[8]=4698.636
RE_[8]=4978.028
MI[8]=5274.04
FA[8]=5587.648
FA_[8]=5919.904
SOL[8]=6270.928
SOL_[8]=6644.972
LA[8]=7040
LA_[8]=7458.616
SI[8]=7902.128


# End of note declarations
#####################################################################

SILENCE=${DO[0]}
TEMPO=250
DURATION=$TEMPO
CURRENT_OCTAVE=0

# Play a note, given its name, octave and length
play()
{
	if [ -z "$1" ]
	then
		return
	fi

	if [ "$1" = "TEMPO" ]
	then
		TEMPO=$2
		DURATION=$TEMPO
		return
	fi		

	if [ -n "$2" ]
	then
		CURRENT_OCTAVE=$2	
	fi

	if [ -n "$3" ] 
	then
		let "DURATION = $TEMPO * $3" 
	fi
	
	if [ "$1" = "_" ]
	then
	  freq=$SILENCE
	else
		note=`eval "expr \$\{\"$1\"\[\"$CURRENT_OCTAVE\"\]\}"`
		freq=`eval "expr \"$note\""`
	fi

	beep -f $freq -l $DURATION 
}

# Read the music sheet
readfile()
{
	
	while read LINE 			
	do
		play `echo $LINE | awk '{ print $1; print $2; print $3}'`
	done
}

main()
{
	if [ -f "$1" ]
	then
		cat $1 | readfile  
	else
		echo "Usage : $0 FILENAME"
	fi

	exit 0
}

main $*
