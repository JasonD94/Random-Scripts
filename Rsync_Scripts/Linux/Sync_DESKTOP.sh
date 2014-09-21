#!/bin/bash
#*****************************************************************************
#  This script will backup my Xubuntu laptop and Xubuntu Desktop
#*****************************************************************************

# Not necessary, but I like to grab the start time.
start=$(date +%s)

# Get the date for a log file.
now=$(date +"%m_%d_%Y")
the_time=$(date +"%T")

# Add some space and the date to the log file.
printf "LAPTOP & DESKTOP SYNC/BACKUP."
cur_date=$(date +"%c")
echo " Backup Date: $cur_date"
printf "\n"

# These are hard coded into the router. They shouldn't change.
# But in case they do, they are defined below.
laptop='jason@192.168.1.7'
desktop='jason@192.168.1.6'
#750GB='/media/Linux-Data'
#1TB='/media/Data/Linux-Data'

# Decided to change how I run my backups.
# It will work like this, backuping the entire home directory (~/):

# Desktop = 240GB SSD, 1TB HDD
# Desktop -> local backup to HDD, external backup to 750GB laptop

# Laptop = 256GB SSD, 750GB HDD
# Laptop -> local backup to HDD, external backup to 1TB desktop

# First, completely backup the desktop's ~/ to the 1TB HDD
# | sed '0,/^$/d' -> just prints the summary out and nothing more.
rsync -azq --delete --exclude /.cache* ~/ \
/media/Data/Linux-Data/Desktop

# Next backup the Desktop to the laptop's 750GB HDD
rsync -azq --delete --exclude /.cache* ~/ \
$laptop:/media/Linux-Data/Desktop

# SSH into the laptop and run the LAPTOP sync script.
# It basically syncs from laptop to laptop HDD and then to
# the desktop's 1TB hard drive.
ssh -t $laptop '~/_Custom/Backup_Laptop.sh'
ssh -t $laptop '~/_Custom/Sync_LAPTOP.sh'

# Let's get the total time it took!
end=$(date +%s)
total=$((end-start))

# Print we done yo to ze screen.
printf "***********************************************************************************\n"
echo   "	FINISHED BACKUP. TOTAL TIME THIS TOOK: " $total "seconds"
printf "***********************************************************************************\n"