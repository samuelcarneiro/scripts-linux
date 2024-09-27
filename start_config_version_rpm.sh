#!/bin/bash

# Script desenvolvido por Samuel Almeida (eu mesmo ^^)
# CREATED 28 AGO 2024

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
    sudo dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-40.noarch.rpm -y
    sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-40
    sudo dnf install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-40.noarch.rpm -y
    sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-40
    echo ""
    echo -e "\e[01;32mRepositórios adicionados com sucesso\!\e[00m"
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
    sudo dnf install neofetch inxi cpufetch gnome-tweaks gnome-extensions-app unrar qbittorrent gparted gimp vlc discord steam papirus-icon-theme -y && sudo dnf install 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm' -y
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
    echo "--------------------------------------------"
    echo "           Menu de configuração             "
    echo "--------------------------------------------"
    echo "1. Atualizar sistema operacional            "
    echo "2. Adicionar repositórios FREE e NON-FREE   "
    echo "3. Instalar drivers AMD                     "
    echo "4. Instalar programas essenciais            "
    echo "5. Instalar ferramentas DEV                 "
    echo "6. Realizar limpeza lógica                  "
    echo "0. Sair                                     "
    echo "--------------------------------------------"

    read -p "Opção: " opcao

    case $opcao in
        1) update_system ;;
        2) add_repository ;;
        3) driver_install ;;
        4) install_essential_programs ;;
        5) dev ;;
        6) logic_limp ;;
        0) echo "Saindo..." ; break ;;
        *) echo -e "\e[01;31mOpção inválida! Tente novamente.\e[00m" ;;
    esac

    read -p "Pressione ENTER para continuar..."
done
