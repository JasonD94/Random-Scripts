#!/bin/bash
#*****************************************************************************
#  Sync Google Drive & Linux desktop
#*****************************************************************************

# Just a test at the moment of the "gsync" tool. It is described as an
# "rsync" for Google Drive. Seeing if it works or not.
# So far it only syncs empty directories though...
# ACTUALLY SUCCESS BY FOLLOWING THIS FIX
# https://github.com/iwonbigbro/gsync/issues/66
# However use python import site; site.getsitepackages() to find the right location!!
sudo time gsync -c -r -t -p -o -g -v --progress ~/_Custom/ drive://_Laptop-Linux-Backup