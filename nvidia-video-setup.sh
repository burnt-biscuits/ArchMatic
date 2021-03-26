#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING NVIDIA\n"

PKGS=(

    # NVIDIA-MAKE-SURE-YOU-ENABLE-MULITLIB-------------------------------

    'nvidia-dkms'
    'nvidia-utils'
    'lib32-nvidia-utils'
    'nvidia-settings'
    'vulkan-icd-loader' 
    'lib32-vulkan-icd-loader'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo -e "\nDone!\n"
