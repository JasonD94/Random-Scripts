#!/bin/bash
#*****************************************************************************
#  simple script to tell huy to be quiet.
#*****************************************************************************

COUNT=100

for((x=1; x<= COUNT; x++ ))
do
	xmacroplay "$DISPLAY" < huy.txt
done

exit