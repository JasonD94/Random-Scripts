#!/bin/bash
#*****************************************************************************
#  Random script that will spam notifications all over the screen
#*****************************************************************************

COUNT=100000

for((a=1; a<= COUNT; a++ ))
do
	notify-send "HELLO"
done

exit