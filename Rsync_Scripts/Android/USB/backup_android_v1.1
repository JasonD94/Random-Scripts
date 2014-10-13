#!/bin/bash

#   V1.1
#   NOTES
#   Requires lsusb, rsync, beep
#   & and LG G3 (other phones, try replacing "LG" with your brand)
#   Also - credit for some of this comes from:
#   http://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem

exec >> /tmp/android_sync.log

# Not necessary, but I like to grab the start time.
start=$(date +%s)

# Need to get the PC speaker working for the BEEPs at the end.
# Comment this & the beep command out if you don't like a beeping computer!
sudo modprobe pcspkr

# NOTE - NEED TO FIND A WAY TO DETECT A USB DEVICE ON PLUG IN.
# THEN THIS WILL BE COMPLETE!!
# So to auto run this upon USB being plugged in, I suggest looking at the
# ".rules" file in this directory. If placed in:
# /etc/udev/rules.d/FILE_GOES_HERE
# Then the script should auto run. See the below thread for more information:
# http://stackoverflow.com/questions/4189383/bash-script-to-detect-when-my-usb-is-plugged-in-and-to-then-sync-it-with-a-direc

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
echo "USB BUS #: " $usb_bus # DEBUGGING

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
rsync -avzh --progress --exclude-from 'exclude_internal.txt' \
$MTP_PATH/Internal\ storage/ \
/media/jason/Data/_G3_Backup/Internal

# This is the second sync - External SD card.
printf "\n\nSTART OF EXTERNAL SD CARD SYNC\n"

# rsync external SD card
rsync -avzh --progress --exclude-from 'exclude_sdcard.txt' \
$MTP_PATH/SD\ card/ \
/media/jason/Data/_G3_Backup/SD_Card

# Let's get the total time it took!
end=$(date +%s)
total=$((end-start))

# Print we done yo to ze screen.
printf "***********************************************************************************\n"
echo   "	FINISHED SYNC. TOTAL TIME THIS TOOK: " $total "seconds"
printf "***********************************************************************************\n"

# Beep when it is done.
beep -r 10
