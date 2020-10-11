#!/bin/bash

HEIGHT=20
WIDTH=60
CHOICE_HEIGHT=4
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"

OPTIONS=(1 "Buscar problemas"
         2 "Ver logs de errores"
         3 "Actualizar lista de mirrors"
         4 "Actualizar sistema"
         5 "Limpiar cache de paquetes no instalados"
         6 "Limpiar paquetes huerfanos"
         7 "Limpiar dependencias no deseadas"
         8 "Limpiar cache de home"
         9 "Limpiar Logs"
         10 "Checkear tamaño carpeta configuraciones"
)

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo -e "\e[104mBuscando problemas\e[m"
            echo
            systemctl --failed
            echo
            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh
            else            
            exit
            fi
            ;;
        2)
            echo -e "\e[104mVer logs de errores\e[m"
            echo
            sudo journalctl -p 3 -xb

            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh 
            else
            exit 
            fi
            ;;
         3)
            echo -e "\e[104mActualizando mirrors\e[m"
            echo
            sudo reflector -c Spain -a 6 --sort rate --save /etc/pacman.d/mirrorlist
            sudo pacman -Syy
            echo
            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            echo
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        4)
            echo -e "\e[104mActualizando el sistema\e[m"
            echo
            yay -Syu

            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        5)
            echo -e "\e[104mLimpiando cache de paquetes no instalados\e[m"
            echo
            yay -Sc

            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        6)
            echo -e "\e[104mLimpiando paquetes huerfanos\e[m"
            echo
            sudo pacman -Rns $(pacman -Qtdq) --noconfirm

            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        7)
            echo -e "\e[104mLimpiando dependencias no deseadas\e[m"
            echo 
            yay -Yc

            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        8)
            echo -e "\e[104mLimpiando cache de home\e[m"
            echo 
            du -sh /home/ruben/.cache/

            read -n1 -r -p "Pulsa e para eliminar y volver al menú o cualquier otra para salir..." key

            if [ "$key" = 'e' ]; then
            rm -rf /home/ruben/.cache/*
            echo
            read -rsp $'\e[104mListo!! Volviendo al menú\e[m' -n 1 -t 2;
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
         9)
            echo -e "\e[104mLimpiando logs\e[m"
            echo
            du -sh /var/log/journal/
            echo
            read -n1 -r -p "Pulsa e para eliminar los Logs más viejos y regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'e' ]; then
            echo
            sudo journalctl --vacuum-time=2days
            ./mantenimiento.sh
            else
            exit
            fi
            ;;
        10)
            echo -e "\e[104mChequeando el tamaño de la carpeta de configuraciones\e[m"
            echo 
            du -sh /home/ruben/.config/
            echo
            echo -e "\e[104mSi pesa mucho, ves a la ruta y borra configuraciones de apps no instaladas\e[m"
            echo
            read -n1 -r -p "Pulsa r para regresar al menú o cualquier otra para salir..." key

            if [ "$key" = 'r' ]; then
            echo
            ./mantenimiento.sh
            else
            exit
            fi
            ;;

esac
