#!/bin/bash
# Script desenvolvido por Samuel Almeida (eu mesmo ^^)
# 26 OUT 2024
#####################################################

# Função de instalação e configuração do servidor web local
# (Apache2, MySQL e MySQL Secure Instalation)
install_server() {
    echo ""
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
    echo ""
}

# Função para iniciar os serviços do servidor
start_services() {
    echo ""
    echo -e "\e[01;36m[ Iniciando serviços... ]\e[00m"
    sudo systemctl start apache2
    sudo systemctl start mysql.service
    echo -e "\e[01;32m[ SERVIDOR OK ]\e[00m"
    sleep 1
    echo -e "\e[01;32m[ Serviços inicializados com sucesso!! ]\e[00m"
}

# Função para reiniciar os serviços do servidor
restart_services() {
    echo ""
    echo -e "\e[01;36m[ Reiniciando serviços... ]\e[00m"
    sudo systemctl restart apache2
    sudo systemctl restart mysql.service
    sleep 1
    echo -e "\e[01;32m[ Serviços reinicializados com sucesso!! ]\e[00m"
}

# Função para parar os servidos do servidor
stop_services() {
    echo ""
    echo -e "\e[01;36m[ Parando serviços... ]\e[00m"
    sudo systemctl stop apache2
    sudo systemctl stop mysql.service
    sleep 1
    echo -e "\e[01;32m[ Serviços parados com sucesso!! ]\e[00m"
}

#Exibir o menu
while true; do
    clear
    echo "------------------------------------"
    echo "        Servidor Web Local          "
    echo "------------------------------------"
    echo " 1. Instalar servidor Apache2&MySQL "
    echo " 2. Iniciar serviços                "
    echo " 3. Reiniciar serviços              "
    echo " 4. Parar serviços                  "
    echo " 0. Sair                            "
    echo "------------------------------------"

    # Capturar escolha
    read -p "Opção: " opcao

    case $opcao in
        1) install_server ;;
        2) start_services ;;
        3) restart_services ;;
        4) stop_services ;;
        0) echo "Saindo das configurações..."; break ;;
        # Qualquer outra escolha, gerará erro
        *) echo "Opção inválida! Escolha as opções do menu." ;;
    esac

    echo ""
    read -p "Precione ENTER para continuar..."
done