#!/bin/bash
# Script desenvolvido por Samuel Carneiro (eu mesmo ^^)
# e dessa vez com uma ajuda do ChatGPT
# 28 ABR 2024

# Atualização

# Função para visualizar as configurações atuais do Git no computador
git_config_atual() {
    echo ""
    echo "Verificando as configurações atuais do Git..."
    sleep 3
    git config --list
    echo ""
}

# Função para configurar o Git
configurar_git() {
    echo ""
    echo "Iniciando a configuração do Git..."
    sleep 1
    read -p "Digite seu nome de usuário do Git: " username
    read -p "Digite seu e-mail do Git: " email
    sleep 1
    git config --global user.name "$username"
    git config --global user.email "$email"
    read -p "Informe do editor de código (code = VSCode / vim / codium): " editor
    sleep 1
    git config --global core.editor "$editor"
    echo ""
    echo "Definindo a branch principal como 'main'..."
    git config --global init.defaultBranch main
    sleep 1
    echo "Salvando as credenciais do usuário localmente..."
    git config --global credential.helper store
    sleep 1
    echo ""
    echo "Git configurado com sucesso!"
    echo ""
}

# Exibir o menu...
while true; do
    clear
    echo "--------------------------------------------"
    echo "Selecione uma opção:                        "
    echo "--------------------------------------------"
    echo "1. Visualizar configurações atuais          "
    echo "2. Configurar Git                           "
    echo "3. Sair                                     "
    echo "--------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in 
        1) git_config_atual ;;
        2) configurar_git ;;
        3) echo "Saindo das configurações..."; break ;;
        *) echo "Opção inválida! Tente novamente." ;;
    esac

    read -p "Precione ENTER para continuar..."
done