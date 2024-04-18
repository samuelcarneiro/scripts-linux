#!/bin/bash
# Script desenvolvido por Samuel Carneiro (eu mesmo ^^)
# 08 FEV 2024

echo ""
echo -e "\e[01;32m       Script de Configuração GIT \e[00m"
echo -e "\e[01;32m+--------------------------------------+\e[00m"
echo -e "\e[01;32m| 1 - Visualizar a configuração atual  |\e[00m"
echo -e "\e[01;32m| 2 - Iniciar configuração do Git      |\e[00m"
echo -e "\e[01;32m+--------------------------------------+\e[00m"
echo -e "\e[01;32m+-----------Informe uma opção!---------+\e[00m"

read opcao;
if [ $opcao == "1" ];
    then
        echo ""
        echo -e "\e[01;32m+------------------------------------+\e[00m"
        echo -e "\e[01;32m| Carregando a configuração atual... |\e[00m"
        echo -e "\e[01;32m+------------------------------------+\e[00m"
        sleep 1
        git config --list
        echo -e "\e[01;32m+------------------------------------+\e[00m"
        echo ""
elif [ $opcao == "2" ];
    then
        echo ""
        echo -e "\e[01;32m+------------------------------------+\e[00m"
        echo -e "\e[01;32m| Iniciando a configuração do GIT... |\e[00m"
        echo -e "\e[01;32m+------------------------------------+\e[00m"
        echo "- Nome do usuário:"
        read userName;
        git config --global user.name "$userName"
        sleep 1
        echo "- E-mail do usuário:"
        read userEmail;
        git config --global user.email "$userEmail"
        sleep 1
        echo "- Qual editor padrão?: [code = VSCode / vim / codium]"
        read editor;
        git config --global core.editor $editor
        echo "- Definindo a Branch principal como 'main'"
        git config --global init.defaultBranch main 
        sleep 1
        echo "- Salvando as credenciais do usuário no computador..."
        git config --global credential.helper store 
        sleep 1
        echo ""
        echo -e "\e[01;32m+--------------------------------------+\e[00m"
        echo -e "\e[01;32m|        Configuração Finalizada!      |\e[00m"
        echo -e "\e[01;32m+--------------------------------------+\e[00m"
        echo ""
fi