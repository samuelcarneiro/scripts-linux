#!/bin/bash
# Script desenvolvido por Samuel Carneiro (eu mesmo ^^)
# 30 DEZ 2023 UPD 07 FEV 2024
echo "+--------------------------------------------------------------+"
echo "|         SCRIPT START LINUX - O QUE DESEJA FAZER?             |"
echo "+--------------------------------------------------------------+"
echo "|                                                              |"
echo "| Selecione uma opção:                                         |"
echo "|                                                              |"
echo "| 1 - Atualizar Pacotes e Programas Pré Instalados & Sistema   |"
echo "| 2 - Instalação Inicial Essencial                             |"
echo "| 3 - Escolher Qual Programa Instalar                          |"
echo "| 4 - Ambiente Desenvolvimento/Programação                     |"
echo "| 5 - Limpeza Lógica                                           |"
echo "| 99 - Sair do Script                                          |"
echo "|                                                              |"
echo "+--------------------------------------------------------------+"
echo "Opção desejada: "
read opcao;

if [ $opcao == "1" ];
then
    echo -e "\e[01;36mAtualizando pacotes, programas e sistema!\e[00m"
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
    echo -e "\e[01;36mInstalação Inicial Essencial em andamento!\e[00m"
    sleep .5
    sudo apt install git vlc unrar ubuntu-restricted-extras qbittorrent gparted neofetch gimp 7zip papirus-icon-theme libu2f-udev inxi mesa-utils -y
    cd /tmp/ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i /tmp/google-chrome*
    sudo apt install -f
    cd
    cd /tmp/ && wget https://code.visualstudio.com/docs/?dv=linux64_deb
    sudo dpkg -i code*
    sudo apt install -f
    cd
    echo ""
    echo -e "\e[01;32mInstalação Inicial Essencial finalizada!\e[00m"
    sleep .5
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
    echo "| 7 - Pacotes Multimídia                                       |"
    echo "| 8 - Google Chrome (site oficial)                             |"
    echo "| 9 - Visual Studeo Code (site oficial)                        |"
    echo "| 99 - Retornar ao Menu Principal                              |"
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
    elif [ $opcao2 == "7" ];
    then
        echo -e "\e[01;36mInstalação do Ubuntu Restricted Extras iniciada...\e[00m"
        sudo apt install ubuntu-restricted-extras -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "8" ];
    then
        echo -e "\e[01;36mInstalação do Google Chrome iniciada...\e[00m"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome*
        sudo apt install -f
        sudo dpkg -i google-chrome*
        echo ""
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcao2 == "9" ];
    then
        echo -e "\e[01;36mInstalação do VSCode iniciada...\e[00m"
        sleep .5
        cd /tmp/ && wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
        sudo dpkg -i vscode.deb
        sudo apt install -f
        sleep .5
        echo ""
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        sleep .5
    elif [ $opcao2 == "99" ];
    then
        echo -e "\e[01;33mRetornando ao menu principal!\e[00m"
    fi
    echo ""
elif [ $opcao == "4" ];
then
    echo "+--------------------------------------------------------------+"
    echo "|            Instalar Programas / Softwares DEV                |"
    echo "+--------------------------------------------------------------+"
    echo "| 0 - Servidor WEB                                             |"
    echo "| 1 - APACHE2                                                  |"
    echo "| 2 - MYSQL                                                    |"
    echo "| 3 - MYSQL_SECURE_INSTALATION                                 |"
    echo "| 4 - PHP                                                      |"
    echo "| 5 - Composer                                                 |"
    echo "| 6 - NodeJS                                                   |"
    echo "| 7 - Python                                                   |"
    echo "| 99 - Retornar ao Menu Principal                              |"
    echo "+--------------------------------------------------------------+"
    read opcaoDev;
    if [ $opcaoDev == "0" ];
    then
        echo -e "\e[01;36mInstalação do Servidor WEB iniciada...\e[00m"
        echo "---------------------------------"
        echo -e "\e[01;36mInstalação do APACHE2 iniciada...\e[00m"
        sudo apt install apache2 libapache2-mod-php -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo -e "\e[01;36mHabilitando Mod_Rewrite...\e[00m"
        sudo a2enmod rewrite
        echo -e "\e[01;32mMod_Rewrite habilidado!\e[00m"
        echo -e "\e[01;36mReiniciando servidor APACHE2...\e[00m"
        sudo systemctl restart apache2
        echo -e "\e[01;32m[ APACHE2 OK ]\e[00m"
        echo "---------------------------------"
        echo -e "\e[01;36mInstalação do MySQL iniciada...\e[00m"
        sudo apt install mysql-server -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo ""
        echo -e "\e[01;36mIniciando configuração do MySQL...\e[00m"
        echo -e "\e[01;33mConfigurando a nova senha do MySQL\e[00m"
        echo -e "\e[01;33mInforme uma nova senha:\e[00m"
        read passwdMysql;
        sudo mysql --user=root --password='' -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwdMysql';"
        echo -e "\e[01;33mSenha alterada com sucesso!\e[00m"
        echo -e "\e[01;32m[ MYSQL OK ]\e[00m"
        echo "---------------------------------"
        echo -e "\e[01;36mConfiguração MYSQL_SECURE_INSTALATION iniciada...\e[00m"
        sudo mysql_secure_installation
        echo -e "\e[01;32mConfiguração finalizada!\e[00m"
        echo ""
        echo -e "\e[01;36mReiniciando servidor MYSQL...\e[00m"
        sudo systemctl restart mysql.service
        echo -e "\e[01;32m[ SECURE INSTALATION MYSQL OK ]\e[00m"
        echo "---------------------------------"
        echo -e "\e[01;36mInstalação do PHP iniciada...\e[00m"
        sudo apt install php php-xml php-curl php-mbstring php-mysql -y
        echo -e "\e[01;32mInstalação finalizada!\e[00m"
        echo ""
        echo -e "\e[01;36mReiniciando servidor...\e[00m"
        sudo systemctl restart apache2
        sudo systemctl restart mysql.service
        echo -e "\e[01;32m[ SERVIDOR OK ]\e[00m"
        echo -e "\e[01;32m[ Servidor WEB instalado e configurado com sucesso!! ]\e[00m"
    elif [ $opcaoDev == "1" ];
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
        sudo mysql --user=root --password='' -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$passwdMysql';"
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
        php -r "if (hash_file('sha384', 'composer-setup.php') === 'edb40769019ccf227279e3bdd1f5b2e9950eb000c3233ee85148944e555d97be3ea4f40c3c2fe73b22f875385f6a5155') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
        php composer-setup.php
        php -r "unlink('composer-setup.php');"
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
        echo ""
        echo -e "\e[01;36mMovendo o Composer para o PATH...\e[00m"
        sudo mv composer.phar /usr/local/bin/composer
        echo -e "\e[01;32mPATH atualizado!\e[00m"
    elif [ $opcaoDev == "6" ];
    then
        echo -e "\e[01;36mInstalação do NodeJS iniciada...\e[00m"
        sudo apt update
        sudo apt install -y ca-certificates curl gnupg
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        NODE_MAJOR=20
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        sudo apt-get update && sudo apt install nodejs -y
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcaoDev == "7" ];
    then
        echo -e "\e[01;36mInstalação Python3 iniciada...\e[00m"
        sudo apt update
        sudo apt install -y python3
        sudo apt install -y python3-pip
        sudo apt install -y python3-venv
        echo -e "\e[01;32mInstalado com sucesso!\e[00m"
    elif [ $opcaoDev == "99" ];
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
elif [ $opcao == "99" ];
then
    echo -e "\e[01;36mAté mais!\e[00m"
    exit
fi
