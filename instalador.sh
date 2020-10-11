#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Post instalador by Rubén"
TITLE="Post Instalador"





cmd=(dialog --separate-output --backtitle "$BACKTITLE" --title "$TITLE" --checklist "Selecciona para instalar:" 22 76 16)
options=(1 "Instalar base" off    # any option can be set to default to "on"
         2 "Grub Customizer" off
         3 "Limpiar Gnome" off
         4 "Instalar YAY" off
         5 "Instalar Extensiones Gnome" off
         6 "Tema LghtDM (yay)" off
         7 "Pamac (yay)" off
         8 "Ulaunch (yay)" off
         9 "Timeshift (yay)" off
         10 "Loginized (yay)" off
         11 "FreeOffice (yay)" off
         12 "Etcher (yay)" off
         13 "Limpiar paquetes huerfanos" off
         14 "Instalar ZSH" off
         15 "Instalar tema ZSH" off
         16 "Instalar drivers Nvidia" off
         17 "Salir" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            read -rsp $'\e[104mInstalando base\e[m' -n 1 -t 2;
            echo
            sudo pacman -S git base-devel nano reflector flatpak curl neofetch --noconfirm
            ;;
        2)
            read -rsp $'\e[104mInstalando Grub Customizer\e[m' -n 1 -t 2;
            echo
            sudo pacman -S grub-customizer --noconfirm
            ;;
        3)
            read -rsp $'\e[104mLimpiando Gnome\e[m' -n 1 -t 2;
            echo
            sudo pacman -Rc quadrapassel swell-foop gnome-tetravex lightsoff five-or-more four-in-a-row gnome-chess hitori gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-sudoku gnome-robots gnome-taquin iagno epiphany polari gnome-recipes tali --noconfirm
            ;;
        4)
            read -rsp $'\e[104mInstalando YAY\e[m' -n 1 -t 2;
            echo
            cd "${HOME}"
            echo "CLOING: YAY"
            git clone "https://aur.archlinux.org/yay.git"
            cd ${HOME}/yay
            makepkg -si --noconfirm
            ;;
        5)
            read -rsp $'\e[104mInstalando extensiones Gnome (falta frippery move clock y dynamic panel transparency)\e[m' -n 1 -t 2;
            echo
            yay -S gnome-shell-extension-dash-to-dock gnome-shell-extension-openweather-git gnome-shell-extension-system-monitor-git --noconfirm
            ;;
        6)
            read -rsp $'\e[104mInstalando tema Aether\e[m' -n 1 -t 2;
            echo
            yay -S lightdm-webkit-theme-aether --noconfirm
            ;;
        7)
            read -rsp $'\e[104mInstalando PAMAC\e[m' -n 1 -t 2;
            echo
            yay -S pamac-aur-git --noconfirm
            ;;
        8)
            read -rsp $'\e[104mInstalando Ulauncher\e[m' -n 1 -t 2;
            echo
            yay -S ulauncher --noconfirm
            ;;
        9)
            read -rsp $'\e[104mInstalando Timeshift\e[m' -n 1 -t 2;
            echo
            yay -S timeshift --noconfirm
            pacman -S cronie --noconfirm
            ;;
        10)
            read -rsp $'\e[104mInstalando Loginized\e[m' -n 1 -t 2;
            echo
            yay -S loginized --noconfirm
            ;;
        11)
            read -rsp $'\e[104mInstalando FreeOffice\e[m' -n 1 -t 2;
            echo
            yay -S freeoffice --noconfirm
            ;;
        12)
            read -rsp $'\e[104mInstalando Etcher\e[m' -n 1 -t 2;
            echo
            yay -S balena-etcher --noconfirm
            ;;
        13)
            read -rsp $'\e[104mLimpiando paquetes huerfanos\e[m' -n 1 -t 2;
            echo
            sudo pacman -Rns $(pacman -Qtdq) --noconfirm
            ;;
        14)
            read -rsp $'\e[104mInstalando ZSH\e[m' -n 1 -t 2;
            echo
            #sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            ;;
        15)
            read -rsp $'\e[104mInstalando tema de ZSH Powerlevel10k\e[m' -n 1 -t 2;
            echo
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf

            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf

            wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

            sudo mv /home/ruben/Descargas/*.ttf /usr/share/fonts/

            clear

            read -rsp $'\e[104mDescargando archivos y configurando terminal\e[m' -n 1 -t 2;

            wget https://github.com/Rupeji/Scripts-Arch/raw/main/config.tar.xz

            tar xf config.tar.xz

            sudo mv /home/ruben/Descargas/zshrc /home/ruben/.zshrc

            sudo mv /home/ruben/Descargas/p10k.zsh /home/ruben/.p10k.zsh
            rm -rf config.tar.xz            
            ;;
        16)
            read -rsp $'\e[104mInstalando drivers de Nvidia\e[m' -n 1 -t 2;
            echo
            sudo pacman -S nvidia --noconfirm
            ;;
        17)
            read -rsp $'\e[104mChao pescao\e[m' -n 1 -t 2;
                exit
            ;;
    esac
done
