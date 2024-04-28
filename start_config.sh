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
    sudo apt install qbittorrent gparted neofetch gimp inxi gnome-tweaks ubuntu-restricted-extras mesa-utils -y
    cd /tmp/ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i /tmp/google-chrome*
    sudo apt install -f
    cd
    cd /tmp/ && wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install -y code
    sudo apt install -f
    cd
    echo ""
    echo -e "\e[01;32mInstalações finalizadas!\e[00m"
    echo ""
}

# Função para instalação de ferramentas de desenvolvedor/programador
install_dev_tools() {
    echo ""
    echo "Instalando ferramentas de desenvolvedor/programador..."
    echo ""
    sleep 1

    # Ferramentas essenciais...

    # Opções de linguagem de programação
    echo "Selecione qual linguagem de programação irá instalar: "
    echo "1. Essencial"
    echo "2. Python"
    echo "3. Node.js"
    echo "4. Java"
    echo "5. C"
    echo "6. Voltar..."
    echo ""

    read -p "Opção: " opcao_lang
    case $opcao_lang in 
        1) install_essential_dev ;;
        2) install_python ;;
        3) install_nodejs ;;
        4) install_java ;;
        5) install_c ;;
        6) return ;;
        *) echo "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac
}

    # Função para instalação essencial de desenvolvimento
    install_essential_dev() {
        echo ""
        echo "Instalação de softwares essenciais para ambiente de desenvolvimento..."
        echo ""
        sudo apt install git libu2f-udev libfuse2 build-essential curl wget software-properties-common apt-transport-https
        sleep 1
        echo ""
        echo -e "\e[01;32mSoftwares instalados com sucesso!\e[00m"
        echo ""
    }

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

    # Função para instalar o Node.js
    install_nodejs() {
        echo ""
        echo "Instalando Node.js..."
        sleep 1
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
        sudo apt-get install -y nodejs
        echo ""
        echo -e "\e[01;32mNode.js instalado com sucesso!\e[00m"
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
        echo -e "\e[01;32mLinguagem de programação C instalada com sucesso!\e[00m"
        echo ""
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
    echo "6. Sair                                     "
    echo "--------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) update_system ;;
        2) install_essential_programs ;;
        3) install_dev_tools ;;
        4) install_multimidia ;;
        5) logic_limp ;;
        6) echo "Saindo..." ; break ;;
        *) echo -e "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac

    read -p "Pressione ENTER para continuar..."
done