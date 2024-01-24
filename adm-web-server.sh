#!/bin/bash
#Script de controle de utilização do servidor web local
#Samuel Carneiro - 23/01/2024 (terça-feira)
#

echo "+-------------------------------------------------------------+"
echo "|       Script de Administração do Servidor Web Local         |"
echo "+-------------------------------------------------------------+"
echo "|                                                             |"
echo "| 1 - Iniciar serviços do Servidor Web Local                  |"
echo "| 2 - Verificar status do Servidor Web Local                  |"
echo "| 3 - Parar serviços do Servidor Web Local                    |"
echo "| 9 - Sair do scriptv                                         |"
echo "|                                                             |"
echo "+-------------------------------------------------------------+"
echo ""
echo ""
read opcao;
if [ $opcao == "1" ];
then
    echo "+-------------------------------------------------------------+"
    echo "|            Administração do Servidor Web Local              |"
    echo "|                          ....                               |"
    echo "|            Iniciando serviços do Apache e MySQL             |"
    echo "|                                                             |"
    sleep 1
    sudo systemctl start apache2
    echo -e "| \e[01;36m * Iniciando Servidor Apache\e[00m                                |"
    sleep 1
    echo -e "| \e[01;32m * OK\e[00m                                                       |"
    sleep 1
    sudo systemctl start mysql
    echo -e "| \e[01;36m * Iniciando Banco da Dados\e[00m                                 |"
    sleep 1
    echo -e "| \e[01;32m * OK\e[00m                                                       |"
    sleep 1
    echo "+-------------------------------------------------------------+"
    echo -e "|            Serviços do Servidor Web Local \e[01;32mATIVOS!\e[00m           |"
    echo "+-------------------------------------------------------------+"
    echo ""
    echo ""
    echo ""
elif [ $opcao == "2" ];
then
    echo "+-------------------------------------------------------------+"
    echo "|            Administração do Servidor Web Local              |"
    echo "|                            ....                             |"
    echo "|          Verificando Status do Servidor Web Local           |"
    echo "+-------------------------------------------------------------+"
    sudo systemctl status apache2
    sleep 1
    sudo systemctl status mysql
    sleep 1
    echo ""
    echo "Deseja continuar? [s/n] "
    read continuar
    if [ $continuar == "s" ];
    then
        sudo ./web-server.sh
    elif [ $continuar == "n" ];
    then
        echo -e "\e[01;36mAté mais!\e[00m"
        exit
    fi
    echo ""
    echo ""
    echo ""
elif [ $opcao == "3" ];
then
    echo "+-------------------------------------------------------------+"
    echo "|            Administração do Servidor Web Local              |"
    echo "|                          ....                               |"
    echo "|             Parando serviços do Apache e MySQL              |"
    echo "+-------------------------------------------------------------+"
    sudo systemctl stop apache2
    echo -e "| \e[01;31m * Parando Servidor Apache\e[00m                                  |"
    sleep 1
    echo -e "| \e[01;32m * OK\e[00m                                                       |"
    sleep 1
    sudo systemctl stop mysql
    echo -e "| \e[01;31m * Parando Banco da Dados\e[00m                                   |"
    sleep 1
    echo -e "| \e[01;32m * OK\e[00m                                                       |"
    sleep 1
    echo "+-------------------------------------------------------------+"
    echo -e "|            Serviços do Servidor Web Local \e[01;31mINATIVOS!\e[00m         |"
    echo "+-------------------------------------------------------------+"
    echo ""
    echo ""
    echo ""
elif [ $opcao == "4" ];
then
    sleep 1
    echo -e "# \e[01;36mAté mais!\e[00m]"
    exit
fi
