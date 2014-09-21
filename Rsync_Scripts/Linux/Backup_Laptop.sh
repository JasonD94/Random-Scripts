#!/bin/bash
#*****************************************************************************
#  Backups the laptops home directory to ites internal 750GB drive
#*****************************************************************************

rsync -az --exclude /.cache* ~/ \
/media/Linux-Data/Laptop