#!/bin/bash

# Script desenvolvido por Samuel Almeida (eu mesmo ^^)
# CREATED 28 AGO 2024

#Função para otimizar o DNF
optimization_dnf() {
    echo ""
    sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
    sudo sh -c 'echo "faststmirror=true" >> /etc/dnf/dnf.conf'  
    sudo sh -c 'echo "deltarpm=true" >> /etc/dnf/dnf.conf'
    echo ""
    echo -e "\e[01;32mConfiguração do DNF finalizada!\e[00m"
    echo ""
}

# Função para atualizar os pacotes do sistema operacional
update_system() {
    echo ""
    echo "Atualizando pacotes e softwares do sistema operacional..."
    echo ""
    sleep 1
    sudo dnf update -y
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mAtualização finalizada!\e[00m"
    echo ""
}

# Função para instalar repositórios FREE e NON-FREE
add_repository() {
    echo ""
    echo "Adicionando repositórios FREE e NON-FREE..."
    echo ""
    sleep 1
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    echo ""
    echo -e "\e[01;32mRepositórios  FREE e NON-FREE adicionados com sucesso\!\e[00m"
    echo ""
}

# Função para instalar drivers de vídeo AMD e aceleração de hardware
driver_install() {
    echo ""
    echo "Instalando drivers de vídeo..."
    echo ""
    sleep 1
    sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y
    sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
    sudo dnf install mesa-dri-drivers.i686 mesa-libGL.i686 xorg-x11-drv-amdgpu -y
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mInstalação finalizada!\e[00m"
    echo ""
}

# Função para instalação de programas essenciais
install_essential_programs() {
    echo ""
    echo "Instalando programas essenciais..."
    echo ""
    sleep 1
    sudo dnf install inxi cpufetch gnome-tweaks gnome-extensions-app unrar qbittorrent gparted gimp vlc steam papirus-icon-theme -y && sudo dnf install 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm' -y
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav--exclude=gstreamer1-plugins-bad-free-devel -y
    sudo dnf install lame\* --exclude=lame-devel
    echo ""
    echo -e "\e[01;32mInstalações finalizadas!\e[00m"
    echo ""
}

# Função para instalar ferramentas de desenvolvedor
dev() {
    echo ""
    echo "Instalando ferramentas Dev e linguagens de programação..."
    echo ""
    sleep 1
    sudo dnf install python3 python3-pip -y
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    dnf check-update
    sudo dnf install code
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mInstalações finalizadas com sucesso\!\e[00m"
    echo ""
}

# Instalação do MySQL
install_mysql() {
    echo ""
    echo "Instalando o MySQL..."
    echo ""
    sleep 1
    sudo dnf install mysql-server -y
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    sudo mysql_secure_installation
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mInstalações e configurações finalizadas com sucesso\!\e[00m"
    echo ""
}

# Instalação do PHP
install_php() {
    echo ""
    echo "Instalando o PHP, Composer e Módulo MySQL..."
    echo ""
    sleep 1
    sudo dnf install php-cli -y
    sudo dnf install phpunit composer -y
    sudo dnf install php-mysqli
    echo ""
    #echo "Atualização finalizada!"
    echo -e "\e[01;32mInstalações finalizadas com sucesso\!\e[00m"
    echo ""
}

# Instalação do NODEJS
install_nodejs() {
    echo "#### installs nvm (Node Version Manager)"
    echo ""
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
    echo ""
    echo "#### Updated .bashrc"
    source ~/.bashrc
    echo ""
    echo -n "#### Which version to install? (ex.: 22): "
    read versionNode
    echo "#### Installing chosen version..."
    nvm install "$versionNode"
    echo ""
    echo -e "\e[01;32mNode.js installed successfully!\e[00m"
    echo ""
    echo "#### Installed versions"
    echo -n "Node.js: "; node -v;
    echo -n "NPM: "; npm -v;
    echo -n "NPX: "; npx -v;
    echo ""
}

# Função para realizar limpeza lógica...
logic_limp() {
    echo ""
    echo "Limpeza lógica em andamento..."
    echo ""
    sleep 1
    sudo dnf autoremove -y
    echo ""
    echo -e "\e[01;32mLimpeza lógica finalizada!\e[00m"
    echo ""
}

# Exibir menu
while true; do
    clear
    echo "------------------------------------------------------"
    echo "                Menu de configuração                  "
    echo "------------------------------------------------------"
    echo "1. Otimizar o DNF                                     "
    echo "2. Adicionar repositórios FREE e NON-FREE             "
    echo "3. Atualizar sistema operacional                      "
    echo "4. Instalar drivers AMD                               "
    echo "5. Instalar programas essenciais                      "
    echo "6. Instalar ferramentas DEV                           "
    echo "7. Instalar MySQL e Mysql Secure Instalation          "
    echo "8. Instalar PHP e Composer                            "
    echo "9. Instalar Node.js                                   "
    echo "10. Realizar limpeza lógica                            "
    echo "0. Sair                                               "
    echo "------------------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) optimization_dnf ;; 
        2) add_repository ;;
        3) update_system ;;
        4) driver_install ;;
        5) install_essential_programs ;;
        6) dev ;;
        7) install_mysql ;;
        8) install_php ;;
        9) install_nodejs ;;
        10) logic_limp ;;
        0) echo "Saindo..." ; break ;;
        *) echo -e "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac

    read -p "Pressione ENTER para continuar..."
done
