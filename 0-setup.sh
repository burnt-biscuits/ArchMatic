#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

#nc=$(grep -c ^processor /proc/cpuinfo)
#echo "You have " $nc" cores."
#echo "-------------------------------------------------"
#echo "Changing the makeflags for "$nc" cores."
#sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$nc"/g' /etc/makepkg.conf
#echo "Changing the compression settings for "$nc" cores."
#sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g' /etc/makepkg.conf
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download          "
echo "-------------------------------------------------"
iso=$(curl -4 ifconfig.co/country-iso)
timedatectl set-ntp true
pacman -S --noconfirm pacman-contrib terminus-font
setfont ter-v22b
sed -i 's/^#Para/Para/' /etc/pacman.conf
pacman -S --noconfirm reflector rsync grub
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
#
echo -e "-Setting up $iso mirrors for faster downloads"
echo -e "-------------------------------------------------------------------------"

reflector -a 48 -c $iso -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
mkdir /mnt
