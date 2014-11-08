#!/bin/bash
#****************************************************************
#  	This script will sync my Xubuntu laptop (LINUX PARTITION) 
#	to a 100GB Internal Partition (EXT4).
#****************************************************************

# Really simple, but good to have it automated.
rsync -avzh --progress --exclude /.cache* ~/ /media/Linux-Data/