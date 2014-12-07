#!/bin/bash
#*****************************************************************************
#  This script will sync my Xubuntu Desktop to an internal 1TB HDD.
#*****************************************************************************

# Really simple, but good to have it automated.
rsync -avzh --progress --exclude /.cache* ~/ /media/Data/Linux_Desktop_Backup/