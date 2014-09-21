Various scripts/settings for new installs of Xubuntu 14.04LTS

bashrc - customized to be shorter and show up in colors.
conkyrc - for use with conky (this one may or may not work)
install_script - mass installs a bunch of program.
Time Format - for quickly setting the time as AM/PM and data as M/D/Year

Quicktile related scripts
rc.local - edit the one in /etc, and add a link to the next script. This autostarts Quicktile (well, rc.local will call the auto start script on boot)
auto_start_quicktile - Quicktile wouldn't autostart for some reason, so by making this script and calling it in rc.local, it now starts in the background. Since I use Xubuntu which has a somewhat crappy tile manager, I prefer this one. I had to edit the config file to use CTRL and SHIFT though, but now pressing CTRL-SHIFT and a number will move the windows to different locations in a grid. 1, 7, 9 and 3 will make four equal windows/terminals/etc. Very useful. Similar to Windows "snap" feature/tile manager but better and more customizable.