#!/bin/bash

# Script desenvolvido por Samuel Almeida (Melhorado com boas práticas)
# CREATED 28 AGO 2024 | UPDATED 13/06/2026

# Cores para o terminal
VERDE="\e[01;32m"
VERMELHO="\e[01;31m"
RESET="\e[00m"

# Função para otimizar o DNF de forma segura (sem duplicar linhas)
optimization_dnf() {
    echo -e "\nOtimizando o DNF..."
    local cnf="/etc/dnf/dnf.conf"
    
    # Verifica se a configuração já existe antes de adicionar
    grep -qF "max_parallel_downloads" $cnf || sudo sh -c "echo 'max_parallel_downloads=10' >> $cnf"
    grep -qF "fastestmirror" $cnf || sudo sh -c "echo 'fastestmirror=true' >> $cnf"
    grep -qF "deltarpm" $cnf || sudo sh -c "echo 'deltarpm=true' >> $cnf"
    
    echo -e "${VERDE}Configuração do DNF finalizada!${RESET}\n"
}

# Função para atualizar os pacotes do sistema
update_system() {
    echo -e "\nAtualizando pacotes e softwares do sistema operacional...\n"
    sleep 1
    sudo dnf upgrade --refresh -y  # --refresh garante que os repositórios estão atualizados
    echo -e "${VERDE}Atualização finalizada!${RESET}\n"
}

# Função para instalar repositórios FREE e NON-FREE
add_repository() {
    echo -e "\nAdicionando repositórios FREE e NON-FREE...\n"
    sleep 1
    sudo dnf install "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" -y
    sudo dnf install "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" -y
    echo -e "${VERDE}Repositórios FREE e NON-FREE adicionados com sucesso!${RESET}\n"
}

# Função para instalar drivers de vídeo AMD e aceleração de hardware
driver_install() {
    echo -e "\nInstalando drivers de vídeo e aceleração AMD...\n"
    sleep 1
    sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
    sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
    sudo dnf install mesa-dri-drivers.i686 mesa-libGL.i686 xorg-x11-drv-amdgpu -y
    echo -e "${VERDE}Instalação de drivers finalizada!${RESET}\n"
}

# Função para instalação de programas essenciais
install_essential_programs() {
    echo -e "\nInstalando programas essenciais...\n"
    sleep 1
    # Dividido em blocos menores para facilitar leitura e manutenção do script
    sudo dnf install inxi cpufetch gnome-tweaks gnome-extensions-app unrar qbittorrent gparted gimp vlc steam papirus-icon-theme -y
    sudo dnf install 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm' -y
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
    sudo dnf install lame\* --exclude=lame-devel -y
    echo -e "${VERDE}Instalações essenciais finalizadas!${RESET}\n"
}

# Função para instalar ferramentas de desenvolvedor
install_dev() {
    echo -e "\nInstalando ferramentas Dev e linguagens de programação...\n"
    sleep 1
    sudo dnf install python3 python3-pip python3-tkinter -y
    
    # Adicionando repositório do VS Code de forma limpa
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    
    sudo dnf check-update
    sudo dnf install code -y
    echo -e "${VERDE}Ferramentas Dev instaladas com sucesso!${RESET}\n"
}

# Instalação do MySQL
install_mysql() {
    echo -e "\nInstalando o MySQL...\n"
    sleep 1
    sudo dnf install mysql-server -y
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    echo -e "${VERDE}MySQL instalado e ativado. Iniciando configuração de segurança...${RESET}\n"
    sudo mysql_secure_installation
}

# Instalação do PHP
install_php() {
    echo -e "\nInstalando o PHP, Composer e Módulo MySQL...\n"
    sleep 1
    sudo dnf install php-cli phpunit composer php-mysqli -y
    echo -e "${VERDE}Instalações do PHP finalizadas com sucesso!${RESET}\n"
}

# Instalação do NODEJS via NVM
install_nodejs() {
    echo -e "\nInstalando o NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    
    # Carrega o NVM para a sessão atual do script (Resolve o problema do source)
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    echo -n "Qual versão do Node.js deseja instalar? (ex.: 22): "
    read versionNode
    
    if [ -z "$versionNode" ]; then
        echo -e "${VERMELHO}Versão inválida. Abortando instalação do Node.${RESET}"
        return 1
    fi

    echo "Instalando a versão escolhida..."
    nvm install "$versionNode"
    
    echo -e "${VERDE}\nNode.js instalado com sucesso!${RESET}"
    echo -n "Node.js: "; node -v;
    echo -n "NPM:     "; npm -v;
    echo -n "NPX:     "; npx -v;
    echo ""
}

# Função para realizar limpeza lógica
logic_limp() {
    echo -e "\nLimpeza lógica em andamento...\n"
    sleep 1
    sudo dnf autoremove -y
    sudo dnf clean all
    echo -e "${VERDE}Limpeza lógica e cache finalizados!${RESET}\n"
}

# Exibir menu
while true; do
    clear
    echo "------------------------------------------------------"
    echo "                Menu de Configuração - Fedora         "
    echo "------------------------------------------------------"
    echo "1. Otimizar o DNF                                     "
    echo "2. Adicionar repositórios FREE e NON-FREE             "
    echo "3. Atualizar sistema operacional                      "
    echo "4. Instalar drivers AMD                               "
    echo "5. Instalar programas essenciais                      "
    echo "6. Instalar ferramentas DEV                           "
    echo "7. Instalar MySQL e Segurança                         "
    echo "8. Instalar PHP e Composer                            "
    echo "9. Instalar Node.js (via NVM)                         "
    echo "10. Realizar limpeza lógica                           "
    echo "0. Sair                                               "
    echo "------------------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) optimization_dnf ;; 
        2) add_repository ;;
        3) update_system ;;
        4) driver_install ;;
        5) install_essential_programs ;;
        6) install_dev ;;
        7) install_mysql ;;
        8) install_php ;;
        9) install_nodejs ;;
        10) logic_limp ;;
        0) echo "Saindo... Até logo!" ; break ;;
        *) echo -e "${VERMELHO}Opção inválida! Tente novamente.${RESET}" ;;
    esac

    echo ""
    read -p "Pressione ENTER para continuar..."
done