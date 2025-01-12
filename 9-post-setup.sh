#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _    
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__ 
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__| 
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "FINAL SETUP AND CONFIGURATION"

# ------------------------------------------------------------------------
echo
echo "Generating .xinitrc file"

# Generate the .xinitrc file so we can launch XFCE from the
# terminal using the "startx" command
cat <<EOF > ${HOME}/.xinitrc
#!/bin/bash
# Disable bell
xset -b
# Disable all Power Saving Stuff
xset -dpms
xset s off
# X Root window color
xsetroot -solid darkgrey
# Merge resources (optional)
#xrdb -merge $HOME/.Xresources
# Caps to Ctrl, no caps
setxkbmap -layout us -option ctrl:nocaps
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "\$f" ] && . "\$f"
    done
    unset f
fi
exec startawesome
EOF

cat <<EOF > ${HOME}/.bash_profile
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
EOF

cp ${HOME}/.xintrc /home/alarm/
cp ${HOME}/.bash_profile /home/alarm/

# ------------------------------------------------------------------------

#echo
#echo "Updating /bin/startx to use the correct path"

# By default, startx incorrectly looks for the .serverauth file in our HOME folder.
sudo sed -i 's|xserverauthfile=\$HOME/.serverauth.\$\$|xserverauthfile=\$XAUTHORITY|g' /bin/startx

# ------------------------------------------------------------------------

echo "Reboot now..."
echo
