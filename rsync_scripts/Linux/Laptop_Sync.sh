#!/bin/bash
#*****************************************************************************
#  This script will sync my Linux Xubuntu laptop with my Xubuntu Desktop
#*****************************************************************************

# Need to rsync the following directories:
# _Custom 
#  Coding
#  Documents
#  Music
#  Pictures
#  Templates
#  Themes
# ** Roughly 1.3GB

# rsync -avzh --progress SOURCE DESTINATION
# Let's sync them in both directions too for good measure.

# First, completely backup the laptop to my desktop's 1TB hard drive.
# Last I checked this was about 5GB.
rsync -avzh --progress jason@192.168.1.16:~/ /media/Data/Linux_Laptop_Backup/

# I wonder, I could do the same to my laptop... Maybe later.

####### Desktop to laptop #######
# This part will actually sync the two machines.

# _Custom
rsync -avzh --progress ~/_Custom jason@192.168.1.16:~/

# Coding
rsync -avzh --progress ~/Coding jason@192.168.1.16:~/

# Documents
rsync -avzh --progress ~/Documents jason@192.168.1.16:~/

# Music
rsync -avzh --progress ~/Music jason@192.168.1.16:~/

# Pictures
rsync -avzh --progress ~/Pictures jason@192.168.1.16:~/

# Templates
rsync -avzh --progress ~/Templates jason@192.168.1.16:~/

# Themes
rsync -avzh --progress ~/Themes jason@192.168.1.16:~/

####### Laptop to desktop #######
# Just the opposite of the above.

# _Backups
rsync -avzh --progress jason@192.168.1.16:~/_Backups ~/

# _Custom
rsync -avzh --progress jason@192.168.1.16:~/_Custom ~/

# Coding
rsync -avzh --progress jason@192.168.1.16:~/Coding ~/

# Documents
rsync -avzh --progress jason@192.168.1.16:~/Documents ~/ 

# Music
rsync -avzh --progress jason@192.168.1.16:~/Music  ~/

# Pictures
rsync -avzh --progress jason@192.168.1.16:~/Pictures  ~/

# Templates
rsync -avzh --progress jason@192.168.1.16:~/Templates ~/ 

# Themes
rsync -avzh --progress jason@192.168.1.16:~/Themes  ~/