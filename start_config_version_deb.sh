#!/bin/bash

# Script desenvolvido por Samuel Carneiro (eu mesmo ^^)
# CREATED 30 DEZ 2023 -> UPD 11 JUN 2024

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
    sudo apt install qbittorrent gparted neofetch cpufetch gimp inxi gnome-tweaks ubuntu-restricted-extras mesa-utils git libu2f-udev libfuse2 software-properties-common vlc ffmpeg papirus-icon-theme -y
    sudo apt install -f
    cd /tmp && wget -O google-chrome-stable.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' && sudo apt install ./google-chrome-stable.deb

    echo ""
    echo -e "\e[01;32mInstalações finalizadas!\e[00m"
    echo ""
}

# Função para instalação de programas essenciais
install_dev_programs() {
    echo ""
    echo "Instalando ferramentas DEV..."
    echo ""
    sleep 1
    sudo apt install fonts-firacode git libu2f-udev libfuse2 build-essential curl wget dkms perl software-properties-common apt-transport-https vlc ffmpeg python3 python3-pip python3-venv default-jre default-jdk gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm \
    libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python3-openssl -y

    echo ""
    echo -e "\e[01;32mInstalações finalizadas!\e[00m"
    echo ""
}

# Função para instalação e configuração de um servidor WEB local
# com PHP e MySQL
install_web_server() {
    echo -e "\e[01;36mInstalação do Servidor WEB iniciada...\e[00m"
    echo "---------------------------------"
    echo -e "\e[01;36mInstalação do APACHE2 iniciada...\e[00m"
    sleep 1
    sudo apt install apache2 libapache2-mod-php -y
    echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    sleep 1
    echo -e "\e[01;36mHabilitando Mod_Rewrite...\e[00m"
    sudo a2enmod rewrite
    echo -e "\e[01;32mMod_Rewrite habilidado!\e[00m"
    sleep 1
    echo -e "\e[01;36mReiniciando servidor APACHE2...\e[00m"
    sudo systemctl restart apache2
    echo -e "\e[01;32m[ APACHE2 OK ]\e[00m"
    echo "---------------------------------"
    sleep 1
    echo -e "\e[01;36mInstalação do MySQL iniciada...\e[00m"
    sudo apt install mysql-server -y
    echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    echo ""
    sleep 1
    echo -e "\e[01;36mIniciando configuração do MySQL...\e[00m"
    echo -e "\e[01;33mConfigurando a nova senha do MySQL\e[00m"
    echo -e "\e[01;33mInforme uma nova senha para o banco de dados:\e[00m"
    read passwdMysql;
    sudo mysql --user=root --password='' -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwdMysql';"
    echo -e "\e[01;33mSenha alterada com sucesso!\e[00m"
    echo -e "\e[01;32m[ MYSQL OK ]\e[00m"
    echo "---------------------------------"
    sleep 1
    echo -e "\e[01;36mConfiguração MYSQL_SECURE_INSTALATION iniciada...\e[00m"
    sudo mysql_secure_installation
    echo -e "\e[01;32mConfiguração finalizada!\e[00m"
    echo ""
    echo -e "\e[01;36mReiniciando servidor MYSQL...\e[00m"
    sudo systemctl restart mysql.service
    echo -e "\e[01;32m[ SECURE INSTALATION MYSQL OK ]\e[00m"
    echo "---------------------------------"
    sleep 1
    echo -e "\e[01;36mInstalação do PHP iniciada...\e[00m"
    sudo apt install php php-xml php-curl php-mbstring php-mysql -y
    echo -e "\e[01;32mInstalação finalizada!\e[00m"
    echo ""
    sleep 1
    echo -e "\e[01;36mReiniciando servidor...\e[00m"
    sudo systemctl restart apache2
    sudo systemctl restart mysql.service
    echo -e "\e[01;32m[ SERVIDOR OK ]\e[00m"
    echo -e "\e[01;32m[ Servidor WEB instalado e configurado com sucesso!! ]\e[00m"
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
    echo 'alias info="neofetch && cpufetch && inxi -G"' >> ~/.bashrc
    echo 'alias instalar="sudo apt install -y"' >> ~/.bashrc
    echo 'alias remove="sudo apt remove"' >> ~/.bashrc
    echo ""
    echo -e "\e[01;32mPara os atalhos funcionarem... reinicie o terminal.\e[00m"
}

# Exibir menu
while true; do
    clear
    echo "--------------------------------------------"
    echo "           Menu de configuração             "
    echo "--------------------------------------------"
    echo "1. Atualizar sistema operacional            "
    echo "2. Instalar programas essenciais            "
    echo "3. Instalar ferramentas DEV                 "
    echo "4. Instalar Web Server Local (PHP&MySQL)    "
    echo "5. Realizar limpeza lógica                  "
    echo "6. Atalhos de comandos no .bashrc           "
    echo "0. Sair                                     "
    echo "--------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) update_system ;;
        2) install_essential_programs ;;
        3) install_dev_programs ;;
        4) install_web_server ;;
        5) logic_limp ;;
        6) shortcut ;;
        0) echo "Saindo..." ; break ;;
        *) echo -e "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac

    read -p "Pressione ENTER para continuar..."
done
