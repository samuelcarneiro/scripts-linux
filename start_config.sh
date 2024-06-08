#!/bin/bash

# Script desenvolvido por Samuel Carneiro (eu mesmo ^^)
# CREATED 30 DEZ 2023 -> UPD 28 ABR 2024

# Função para atualizar os pacotes do sistema operacional
update_system() {
    echo ""
    echo "Atualizando pacotes e softwares do sistema operacional..."
    echo ""
    sleep 1
    sudo apt update && sudo apt upgrade -y
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mAtualização finalizada!\e[00m"
    echo ""
}

# Função para instalação de programas essenciais
install_essential_programs() {
    echo ""
    echo "Instalando programas essenciais..."
    echo ""
    sleep 1
    sudo apt install qbittorrent gparted neofetch cpufetch gimp inxi gnome-tweaks fonts-firacode ubuntu-restricted-extras mesa-utils git libu2f-udev libfuse2 build-essential curl wget software-properties-common apt-transport-https -y
    sudo apt install -f
    echo ""
    echo -e "\e[01;32mInstalações finalizadas!\e[00m"
    echo ""
}

# Função para instalação de linguagens de programação
install_dev_tools() {
    # Opções de linguagem de programação
    echo "Selecione qual linguagem de programação irá instalar: "
    echo "1. Python"
    echo "2. Java"
    echo "3. C"
    echo "0. Voltar..."
    echo ""

    read -p "Opção: " opcao_lang
    case $opcao_lang in 
        1) install_python ;;
        2) install_java ;;
        3) install_c ;;
        0) return ;;
        *) echo "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac
    # Função para instalar o Python
    install_python() {
        echo ""
        echo "Instalando Python..."
        sleep 1
        sudo apt install -y python3 python3-pip python3-venv
        sleep 1
        echo ""
        echo -e "\e[01;32mLinguagem de programação Python instalada com sucesso!\e[00m"
        echo ""
    }

    # Função para instalar o JAVA
    install_java() {
        echo ""
        echo "Instalando JRE e JDK (JAVA)..."
        sleep 1
        sudo apt install -y default-jre default-jdk
        sleep 1
        echo ""
        echo -e "\e[01;32mLinguagem de programação JAVA instalada com sucesso!\e[00m"
        echo ""
    }

    # Função para instalar a linguagem de programação C
    install_c() {
        echo ""
        echo "Instalando C..."
        sleep 1
        sudo apt install -y gcc
        sleep 1
        echo ""
        echo -e "\e[01;32mLinguagem de programação C instalada com sucesso!\e[00m"
        echo ""
    }
}

# Função para instalar pacote multimídia
install_multimidia() {
    echo ""
    echo "Instalando pacotes multimídia..."
    echo ""
    sleep 1
    sudo apt install -y vlc ffmpeg
    sleep 1
    echo ""
    echo -e "\e[01;32mPacotes multimídia instalados com sucesso!\e[00m"
    echo ""
}

# Função para realizar limpeza lógica...
logic_limp() {
    echo ""
    echo "Limpeza lógica em andamento..."
    echo ""
    sleep 1
    sudo apt autoremove -y && sudo apt autoclean -y
    echo ""
    echo -e "\e[01;32mLimpeza lógica finalizada!\e[00m"
    echo ""
}

# Atalhos no arquivo .bashrc
shortcut() {
    echo " "
    echo "#Meus atalhos" >> ~/.bashrc
    echo 'alias atualizar="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
    echo 'alias limpar="sudo apt autoremove && sudo apt autoclean -y"' >> ~/.bashrc
    echo 'alias info="neofetch && cpufetch"' >> ~/.bashrc
    echo 'alias instalar="sudo apt install -y"' >> ~/.bashrc
    echo 'alias remove="sudo apt remove"' >> ~/.bashrc
    echo ""
    echo -e "\e[01;32mPara os atalhos funcionarem... reinicie o terminal.\e[00m"
}

# Exibir menu
while true; do
    clear
    echo "--------------------------------------------"
    echo "Menu de configuração:                       "
    echo "--------------------------------------------"
    echo "1. Atualizar sistema operacional            "
    echo "2. Instalar programas essenciais            "
    echo "3. Instalar ferramentas de desenvolvedor    "
    echo "4. Instalar pacotes multimídia              "
    echo "5. Realizar limpeza lógica                  "
    echo "6. Atalhos de comandos no .bashrc           "
    echo "0. Sair                                     "
    echo "--------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) update_system ;;
        2) install_essential_programs ;;
        3) install_dev_tools ;;
        4) install_multimidia ;;
        5) logic_limp ;;
        6) shortcut ;;
        0) echo "Saindo..." ; break ;;
        *) echo -e "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac

    read -p "Pressione ENTER para continuar..."
done
