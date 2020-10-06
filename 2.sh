#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALANDO SOFTWARE\n"

read -rsp $'En 2 segundos o pulsa ENTER para continuar...\n' -n 1 -t 2;


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

wget https://github.com/Rupeji/Scripts-Arch/blob/main/p10k.zsh

wget https://github.com/Rupeji/Scripts-Arch/blob/main/zshrc

sudo cp -R /home/ruben/Descargas/*.ttf /usr/share/fonts/

clear

echo -e "\nConfirurando terminal\n"

read -rsp $'En 2 segundos o pulsa ENTER para continuar...\n' -n 1 -t 2;

sudo mv /home/ruben/Descargas/zshrc /home/ruben/.zshrc

sudo mv /home/ruben/Descargas/p10k.zsh /home/ruben/.p10k.zsh

echo -e "\nListo!!!\n"
