#!/bin/bash
#*****************************************************************************
#  Laptop client script
#*****************************************************************************
desktop='jason@192.168.1.6'

# Backup the laptop to the Desktop's 1TB HDD
rsync -azq --delete --exclude /.cache* ~/ \
$desktop:/media/Data/Linux-Data/Laptop