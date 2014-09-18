# Some of these were found at:
# http://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc

# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias woo='fortune'
alias lsd="ls -alF | grep /$"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Command line mplayer movie watching for the win.
alias mp="mplayer -fs"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# This will keep you sane when you're about to smash the keyboard again.
alias frak="fortune"

# Misc git aliases, decided to roll my own vs deal with random scripts online.
# So these are just ones I decided to make & customize.
alias a="git add -A"
alias b="git branch"
alias co="git checkout"
alias cm="git commit -m"
alias d="git diff"
alias s="git status"