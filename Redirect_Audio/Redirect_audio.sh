#!/bin/bash
# Redirect audio
# Whenever I get this working, I'll have it setup so I can send music to Google Hangouts/Skype/any other VOIP.

#load-module module-loopback sink=alsa_output.pci-0000_00_1b.0.analog-stereo source=alsa_input.pci-0000_00_1b.0.analog-stereo

pactl load-module module-null-sink sink_name=TO_HANGSOUT
pactl load-module module-null-sink sink_name=TO_HEADPHONES
pactl load-module module-loopback sink=TO_HANGOUTS
pactl load-module module-loopback sink=TO_HEADPHONES