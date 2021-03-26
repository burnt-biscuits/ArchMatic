#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AMD\n"

PKGS=(

    # AMD-MAKE-SURE-YOU-ENABLE-MULITLIB-------------------------------

    'lib32-mesa'
    'vulkan-radeon'
    'lib32-vulkan-radeon'
    'vulkan-icd-loader'
    'lib32-vulkan-icd-loader' 
    
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nDone!\n"
