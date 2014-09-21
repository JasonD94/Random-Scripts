#!/bin/bash

#   V1.4
#   NOTES
#   Requires lsusb, rsync, beep, gedit (or change the log opening line to another editor)
#   & and a LG G3 (other phones, try replacing "LG" with your brand)
#   Also - credit for some of this comes from:
#   http://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem

#*******************************************************************************************
# 	I couldn't figure out how to auto launch this script on device plug in. >_<
# 	What I suggest is to just create a launcher on your desktop called "Backup Android"
# 	and run it whenever you need to charge your phone. Just plug it into your PC, make sure
# 	the device is mounted (check your file manager and click on the device to make sure you
#	see "Internal" and "SD_Card" listed) and click on the launcher, which should be setup to
# 	find this script and run it in a terminal (so you can see if it worked or not)
#*******************************************************************************************

# Not necessary, but I like to grab the start time.
start=$(date +%s)

# Get the date for a log file.
now=$(date +"%m_%d_%Y")
the_time=$(date +"%T")
# Check for a sync folder, so we can store backup logs in one place.
if [ ! -d ~/".Android_Sync_Logs" ]; then
	# Make a directory to hold each backup log. (Check for errors there!)
	mkdir ~.Android_Sync_Logs 
fi

# Log everything for future reference
exec >> ~/.Android_Sync_Logs/sync_"$now"_"$the_time".log

# Variables set here. Change any paths, device brands, etc here.
DEVICE_BRAND='LG'

# These are locations on your computer! Ex: your 1TB hard drive.
# You could also use your home directory if you have enough room.
INTERNAL_BACKUP_PATH='/media/Data/_G3_Backup/Internal' 
EXTERNAL_BACKUP_PATH='/media/Data/_G3_Backup/SD_Card'
#################################################################################

# Add some space and the date to the log file.
printf "ANDROID AUTOBACKUP."
cur_date=$(date +"%c")
echo " Backup Date: $cur_date"
printf "\n"

# Need to get the PC speaker working for the BEEPs at the end.
# Comment this & the beep command out if you don't like a beeping computer!
sudo modprobe pcspkr

# Detect changes to the MTP protcol
# Also - this was made for an LG G3. If you own a different device,
# change the last part of the "grep" command. See what the output of
# lsusb gives you for a manufacturer and replace the "LG" with that. 
echo "FULL DEVICE INFO: "
OUTPUT="$(lsusb | grep LG)"
printf "*****************************************************\n"
echo $OUTPUT
printf "*****************************************************\n"

# Get the USB_BUS # of our phone
usb_bus="${OUTPUT% Device*}"
usb_bus="${usb_bus#Bus }"
echo "USB    BUS #: " $usb_bus # DEBUGGING

# Now let's get the USB_DEVICE # of the phone
usb_device="${OUTPUT%%:*}"
usb_device="${usb_device#*Device }"
echo "USB DEVICE #: " $usb_device

# Now we can get the path for our sync! YAY!
MTP_PATH="/run/user/1000/gvfs/mtp:host=%5Busb%3A${usb_bus}%2C${usb_device}%5D"
echo "MTP PATH: " $MTP_PATH

# This is the first sync - Internal Memory.
printf "\n\nSTART OF INTERNAL SYNC\n"

# rsync internal phone memory
# Note: >> and 2>&1 redirects the output to a log file in /tmp/
rsync -avzh --progress --exclude-from 'exclude_internal.txt' \
$MTP_PATH/Internal\ storage/ \
$INTERNAL_BACKUP_PATH >> ~/.Android_Sync_Logs/sync_"$now"_"$the_time".log 2>&1

# This is the second sync - External SD card.
printf "\n\nSTART OF EXTERNAL SD CARD SYNC\n"

# rsync external SD card
rsync -avzh --progress --exclude-from 'exclude_sdcard.txt' \
$MTP_PATH/SD\ card/ \
$EXTERNAL_BACKUP_PATH >> ~/.Android_Sync_Logs/sync_"$now"_"$the_time".log 2>&1

# Let's get the total time it took!
end=$(date +%s)
total=$((end-start))

# Print we done yo to ze screen.
printf "***********************************************************************************\n"
echo   "	FINISHED SYNC. TOTAL TIME THIS TOOK: " $total "seconds"
printf "***********************************************************************************\n"

# Beep when it is done.
beep -r 5