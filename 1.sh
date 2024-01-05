#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------
#Color		Texto	Fondo texto
#Black		30	40
#Red		31	41
#Green		32	42
#Yellow		33	43
#Blue		34	44
#Magenta	35	45
#Cyan		36	46
#Light Gray	37	47
#Gray		90	100
#Light Red	91	101
#Light Green	92	102
#Light Yellow	93	103
#Light Blue	94	104
#Light Magenta	95	105
#Light Cyan	96	106
#White		97	107

#Code	Descripción
#0	Reset/Normal
#1	Bold text
#2	Faint text
#3	Italics
#4	Underlined text

#Colores
Black="30"
Red="31"
Green="32"
Yellow="33"
Blue="34"
Magenta="35"
Cyan="36"
LightGray="37"
Gray="90"
LightRed="91"
LightGreen="92"
LightYellow="93"
LightBlue="94"
LightMagenta="95"
LightCyan="96"
White="97"

#Fondos
FBlack="40"
FRed="41"
FGreen="42"
FYellow="43"
FBlue="44"
FMagenta="45"
FCyan="46"
FLightGray="47"
FGray="100"
FLightRed="101"
FLightGreen="102"
FLightYellow="103"
FLightBlue="104"
FLightMagenta="105"
FLightCyan="106"
FWhite="107"

#-------------------------------------------------------------------------
#    Esto cambia los títulos
#
COLOR="${White}"
BGCOLOR="\e[${FBlue}m"
#
#-------------------------------------------------------------------------

#Esto es fijo para los títulos
BOLDCOLOR="\e[1;${COLOR}m"
BACKGROUND="\e[${BGCOLOR}"
ENDCOLOR="\e[0m"

#-------------------------------------------------------------------------
#
#   Esto cambia los colores de las pantallas de carga
#
Colorin="${White}"
ColorDeFondo="\e[${FCyan}m"
#
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
#   Esto es fijo paracambiar las pantallas de carga
#
ColorNegrita="\e[1;${Colorin}m"
Fondo="\e[${ColorDeFondo}"

#-------------------------------------------------------------------------
#   Esto es el color para el texto que muestra el comando 11
#
Once="\e[1;${Blue}m"
#
#-------------------------------------------------------------------------

#-------------------------------------------------------------------------
#   Esto mete una pausa al añadir "pausa" en el código
#
function pausa(){
read -p "$*"
}
#
#-------------------------------------------------------------------------

menu_choice=""
while [ "$menu_choice" != "17" ]
do
clear
echo
echo -e "${BOLDCOLOR}${BACKGROUND}Por favor, selecciona una opción${ENDCOLOR}"
echo
echo "1.  Instalar imprescindibles" 
echo "2.  Instalar drivers USB"
echo "3.  Instalar Wifite"
echo "4.  Descargar Github"
echo
echo "5. Salir"
echo

read menu_choice
clear
case $menu_choice in
        1)
            echo -e "${ColorNegrita}${Fondo}Instalando imprescindibles${ENDCOLOR}"
            echo
	    sleep 2
	    cd "${HOME}"
	    mkdir github
            sudo pacman -S base-devel nano firefox kitty wget curl unzip p7zip neofetch --noconfirm
            echo
	    echo -e "${BOLDCOLOR}${BACKGROUND}Pulsa [Enter] para continuar...${ENDCOLOR}"
	    pausa
            ;;
        2)
            echo -e "${ColorNegrita}${Fondo}Instalando drivers${ENDCOLOR}"
            echo
	    sleep 2            
            sudo pacman -S --noconfirm linux-headers dkms git bc iw
	    cd ~/Documentos/
	    mkdir -p DriversUSB
	    cd ~/Documentos/DriversUSB/
	    git clone https://github.com/morrownr/8821au-20210708.git
	    cd ~/8821au-20210708/
	    sudo dkms add ./8821au-20210708
	    sudo dkms install rtl8821au/5.12.5.2
            echo
	    echo -e "${BOLDCOLOR}${BACKGROUND}Pulsa [Enter] para continuar...${ENDCOLOR}"
            echo
	    pausa
            ;;
        3)
            echo -e "${ColorNegrita}${Fondo}Instalando Wifite y sus complementos${ENDCOLOR}"
            echo
	    sleep 2
            sudo pacman -S hcxtools hcxdumptool reaver macchanger hashcat john cowpatty bully wifite wireshark-cli --noconfirm #falta Pyrit
            echo
	    echo -e "${BOLDCOLOR}${BACKGROUND}Pulsa [Enter] para continuar...${ENDCOLOR}"
	    pausa
            ;;
        4)  
            echo -e "${ColorNegrita}${Fondo}Descargando git${ENDCOLOR}"
            echo
	    sleep 2
            
	    cd 
 	    git clone https://MRR4bot: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@github.com/MRR4bot/Setup.git
	    echo -e "${BOLDCOLOR}${BACKGROUND}Pulsa [Enter] para continuar...${ENDCOLOR}"
            echo
	    pausa
            ;;

        5)
            echo -e "${ColorNegrita}${Fondo}Chao pescao${ENDCOLOR}"
            echo
	    sleep 2
            clear
	    exit
            ;;
    esac
done


# git clone https://github.com/mlaj10/Bspwm.git
#
#
#
