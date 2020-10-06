#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALANDO SOFTWARE\n"

read -rsp $'En 2 segundos o pulsa ENTER para continuar...\n' -n 1 -t 2;

sudo pacman -S git base-devel nano grub-customizer flatpak curl neofetch --noconfirm

clear

echo -e "\nINSTALANDO SOFTWARE DE AUR\n"

read -rsp $'En 2 segundos o pulsa ENTER para continuar...\n' -n 1 -t 2;

cd "${HOME}"

echo "CLOING: YAY"
git clone "https://aur.archlinux.org/yay.git"

cd ${HOME}/yay
makepkg -si --noconfirm

yay -S lightdm-webkit-theme-aether --noconfirm

yay -S pamac-aur-git --noconfirm

yay -S ulaunch --noconfirm  

yay -S timeshift --noconfirm 

#yay -S loginized --noconfirm

#yay -S freeoffice --noconfirm

#yay -S balena-etcher --noconfirm

echo -e "\Limpiando paquetes huerfanos\n"

sudo pacman -Rs $(pacman -Qtdq) --noconfirm

clear

echo -e "\nINSTALANDO OH MY ZSH\n"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "\nDone!\n"
