#!/bin/bash
#*****************************************************************************
#  Even more annoying macro.
#*****************************************************************************

COUNT=10

for((x=1; x<= COUNT; x++ ))
do
	xmacroplay "$DISPLAY" < more-spam.txt
done

exit