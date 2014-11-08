#!/bin/bash
#*****************************************************************************
#  Sync Google Drive & Linux desktop
#*****************************************************************************

# This doesn't seem to work very efficiently, but I saved it incase I can figure out
# how to make it sync quicker. ~1MB directory took nearly 15 minutes...
# Perhaps figuring out how to mount Google Drive as a network drive would work.
# Google, y u no make Linux Google Drive Client! >_<
sudo time gsync -c -r -t -p -o -g -v --progress ~/_Custom/ drive://_Laptop-Linux-Backup