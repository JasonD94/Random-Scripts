#!/bin/bash
#*****************************************************************************
#  This script will sync my Xubuntu laptop with my Xubuntu Desktop
#*****************************************************************************

# rsync -avzh --progress SOURCE DESTINATION
# Let's sync them in both directions too for good measure.

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

# Define this here in case it changes!
destination="jason@192.168.1.7"

# First, completely backup the laptop to my desktop's 1TB hard drive.
# Last I checked this was about 5GB.
rsync -avzh --exclude /.cache* ${destination}:~/ \
/media/Data/Linux_Laptop_Backup/ 

# Second, run a backup script I already made to backup my desktop
# Xubuntu to an internal 1TB drive on the desktop.
~/_Custom/Autorun/Desktop_Internal_Backup.sh

####### Desktop to laptop #######
# This part will actually sync the two machines.

# _Custom
rsync -avzh ~/_Custom ${destination}:~/

# Coding
rsync -avzh ~/Coding ${destination}:~/ 

# Documents
rsync -avzh ~/Documents ${destination}:~/

# Music
rsync -avzh ~/Music ${destination}:~/ 

# Pictures
rsync -avzh ~/Pictures ${destination}:~/ 

# Templates
rsync -avzh ~/Templates ${destination}:~/ 

# Themes
rsync -avzh ~/Themes ${destination}:~/

####### Laptop to desktop #######
# Just the opposite of the above.

# _Custom
rsync -avzh ${destination}:~/_Custom ~/
# Coding
rsync -avzh ${destination}:~/Coding ~/

# Documents
rsync -avzh ${destination}:~/Documents ~/

# Music
rsync -avzh ${destination}:~/Music  ~/

# Pictures
rsync -avzh ${destination}:~/Pictures  ~/ 

# Templates
rsync -avzh ${destination}:~/Templates ~/ 

# Themes
rsync -avzh ${destination}:~/Themes  ~/ 

# Let's get the total time it took!
end=$(date +%s)
total=$((end-start))

# Print we done yo to ze screen.
printf "***********************************************************************************\n"
echo   "	FINISHED SYNC. TOTAL TIME THIS TOOK: " $total "seconds"
printf "***********************************************************************************\n"