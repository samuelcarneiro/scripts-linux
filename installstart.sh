#!/bin/bash
# Script desenvolvido por mim
# 01 OUT 2023
echo "+--------------------------------------------------------------+"
echo "|         SCRIPT START LINUX - O QUE DESEJA FAZER?             |"
echo "+--------------------------------------------------------------+"
echo "|                                                              |"
echo "| Selecione uma opção:                                         |"
echo "|                                                              |"
echo "| 1 - Atualizar Pacotes e Programas                            |"
echo "| 2 - Instalação Inicial                                       |"
echo "| 3 - Instalar Programas                                       |"
echo "| 4 - Programas/Softwares DEV                                  |"
echo "| 5 - Limpeza Lógica                                           |"
echo "| 9 - Sair do Script                                           |"
echo "|                                                              |"
echo "+--------------------------------------------------------------+"
echo "Opção desejada: "
read opcao;

if [ $opcao == "1" ];
then
    echo -e "\e[01;36mAtualizando pacotes e programas!\e[00m"
    sudo apt update && sudo apt upgrade -y
    echo -e "\e[01;32mAtualização finalizada!\e[00m"
    echo ""
    echo "Deseja continuar? [s/n] "
    read continuar
    if [ $continuar == "s" ];
    then
        sudo ./installstart.sh
    elif [ $continuar == "n" ];
    then
        echo -e "\e[01;36mAté mais!\e[00m"
        exit
    fi
elif [ $opcao == "2" ];
then
    echo -e "\e[01;36mInstalação inicial em andamento!\e[00m"
    sudo apt install git vlc unrar ubuntu-restricted-extras qbittorrent gparted neofetch -y
    echo -e "\e[01;32mInstalação inicial finalizada!\e[00m"
    echo ""
    echo "Deseja continuar? [s/n] "
    read continuar
    if [ $continuar == "s" ];
    then
        sudo ./installstart.sh
    elif [ $continuar == "n" ];
    then
        echo -e "\e[01;36mAté mais!\e[00m"
        exit
    fi
elif [ $opcao == "3" ];
then
    echo "+--------------------------------------------------------------+"
    echo "| Instalação de Programas Específicos                          |"
    echo "+--------------------------------------------------------------+"
    echo "| 1 - VLC                                                      |"
    echo "| 2 - Qbittorrent                                              |"
    echo "| 3 - Gparted                                                  |"
    echo "| 4 - Git                                                      |"
    echo "| 5 - Gimp                                                     |"
    echo "| 6 - Neofetch                                                 |"
    echo "| 9 - Retornar ao Menu Principal                               |"
    echo "+--------------------------------------------------------------+"
    read opcao2;
    if [ $opcao2 == "1" ];
    then
        echo -e "\e[01;36mInstalação do VLC iniciada...\e[00m"
        sudo apt install vlc -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "2" ];
    then
        echo -e "\e[01;36mInstalação do QBittorrent iniciada...\e[00m"
        sudo apt install qbittorrent -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "3" ];
    then
        echo -e "\e[01;36mINstalação do GParted iniciada...\e[00m"
        sudo apt install gparted -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "4" ];
    then
        echo -e "\e[01;36mInstalação do Git iniciada...\e[00m"
        sudo apt install git -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "5" ];
    then
        echo -e "\e[01;36mInstalação do Gimp iniciada...\e[00m"
        sudo apt install gimp -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "6" ];
    then
        echo -e "\e[01;36mInstalação do Neofetch iniciada...\e[00m"
        sudo apt install neofetch -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        neofetch
    elif [ $opcao2 == "9" ];
    then
        echo -e "\e[01;33mRetornando ao menu principal!\e[00m"
    fi
    echo ""
    ./installstart.sh
elif [ $opcao == "4" ];
then
    echo "+--------------------------------------------------------------+"
    echo "|            Instalar Programas / Softwares DEV                |"
    echo "+--------------------------------------------------------------+"
    echo "| 1 - APACHE2                                                  |"
    echo "| 2 - MYSQL                                                    |"
    echo "| 3 - MYSQL_SECURE_INSTALATION                                 |"
    echo "| 4 - PHP                                                      |"
    echo "| 5 - Composer                                                 |"
    echo "| 9 - Retornar ao Menu Principal                               |"
    echo "+--------------------------------------------------------------+"
    read opcaoDev;
    if [ $opcaoDev == "1" ];
    then
        echo -e "\e[01;36mInstalação do APACHE2 iniciada...\e[00m"
        sudo apt install apache2 libapache2-mod-php -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo ""
        echo -e "\e[01;36mHabilitando Mod_Rewrite...\e[00m"
        sudo a2enmod rewrite
        echo -e "\e[01;32mMod_Rewrite habilidado!\e[00m"
        echo -e "\e[01;36mReiniciando servidor APACHE2...\e[00m"
        sudo systemctl restart apache2
        echo -e "\e[01;32m[ OK ]\e[00m"
    elif [ $opcaoDev == "2" ];
    then
        echo -e "\e[01;36mInstalação do MySQL iniciada...\e[00m"
        sudo apt install mysql-server -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo ""
        echo -e "\e[01;36mIniciando configuração do MySQL...\e[00m"
        echo -e "\e[01;33mConfigurando a nova senha do MySQL\e[00m"
        echo -e "\e[01;33mInforme uma nova senha:\e[00m"
        read passwdMysql;
        mysql --user=root --password='' -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwdMysql';"
        echo -e "\e[01;33mSenha alterada com sucesso!\e[00m"
    elif [ $opcaoDev == "3" ];
    then
        echo -e "\e[01;36mConfiguração MYSQL_SECURE_INSTALATION iniciada...\e[00m"
        sudo mysql_secure_installation
        echo -e "\e[01;32mConfiguração finalizada!\e[00m"
        echo ""
        echo -e "\e[01;36mReiniciando servidor MYSQL...\e[00m"
        sudo systemctl restart mysql.service
        echo -e "\e[01;32m[ OK ]\e[00m"
    elif [ $opcaoDev == "4" ];
    then
        echo -e "\e[01;36mInstalação do PHP iniciada...\e[00m"
        sudo apt install php php-xml php-curl php-mbstring php-mysql -y
        echo -e "\e[01;32mInstalação finalizada!\e[00m"
        echo ""
        echo -e "\e[01;36mReiniciando servidor APACHE2...\e[00m"
        sudo systemctl restart apache2
        echo -e "\e[01;32m[ OK ]\e[00m"
    elif [ $opcaoDev == "5" ];
    then
        echo -e "\e[01;36mInstalação do Composer iniciada...\e[00m"
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
        php composer-setup.php
        php -r "unlink('composer-setup.php');"
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo ""
        echo -e "\e[01;36mMovendo o Composer para o PATH...\e[00m"
        sudo mv composer.phar /usr/local/bin/composer
        echo -e "\e[01;32mPATH atualizado!\e[00m"

    elif [ $opcao2 == "6" ];
    then
        echo -e "\e[01;36mInstalação do Gimp iniciada...\e[00m"
        sudo apt install gimp -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "9" ];
    then
        echo "Voltando ao menu principal..."
    fi
    echo ""
    ./installstart.sh
elif [ $opcao == "5" ];
then
    echo -e "\e[01;36mLimpeza lógica em andamento!\e[00m"
    sudo apt autoremove && sudo apt autoclean -y
    echo -e "\e[01;32mLimpeza lógica finalizada!\e[00m"
    echo ""
    echo "Deseja continuar? [s/n] "
    read continuar
    if [ $continuar == "s" ];
    then
        sudo ./installstart.sh
    elif [ $continuar == "n" ];
    then
        echo -e "\e[01;36mAté mais!\e[00m"
        exit
    fi
elif [ $opcao == "9" ];
then
    echo -e "\e[01;36mAté mais!\e[00m"
    exit
fi
