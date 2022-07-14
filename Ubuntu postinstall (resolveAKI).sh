#!/usr/bin/env bash

# ----------------------------- 1 Etapa - PREPARANDO AMBIENTE ----------------------------- #
## Removendo travas do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualizando o repositório ##
sudo apt update -y

## Download pacotes DEB ##
mkdir /home/$USER/ProgramasDEB
cd /home/$USER/ProgramasDEB
wget -c  https://dl.winehq.org/wine-builds/winehq.key
wget -c  https://dl.winehq.org/wine-builds/ubuntu/
wget -c  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -c  https://dl.4kdownload.com/app/4kvideodownloader_4.9.2-1_amd64.deb

## Adicionando repositórios de terceiros e suporte a Snap (Driver Logitech, Lutris e Drivers Nvidia)##
sudo apt-add-repository "ppa:libratbag-piper/piper-libratbag-git" -y
sudo add-apt-repository "ppa:lutris-team/lutris" -y
sudo apt-add-repository "ppa:graphics-drivers/ppa" -y
sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main" -y
sudo apt-key add winehq.key
# ---------------------------------------------------------------------- #

# ----------------------------- 2 Etapa - INSTALAÇÃO APT ----------------------------- #
## 2.1 - Instalando pacotes APT ##
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

## 2.2 - Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## 2.3 - Instalar programas no apt ##
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## 2.4 - Instalando pacotes Flatpak ##
flatpak install flathub com.obsproject.Studio -y

## 2.5 - Instalando pacotes Snap ##
sudo snap install spotify
sudo snap install slack --classic

## 2.6 - Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $HOME/ProgramasDEB/*.deb

## 2.7 - Update##
sudo apt update -y

# ---------------------------------------------------------------------- #

# ----------------------------- 3 Etapa - PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
rmdir /home/$USER/ProgramasDEB
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #


# ----------------------------------- REPOSITORIO ----------------------------------- #

# ----------------------------- NOME DOS PACOTES (APT) ----------------------------- #
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
  snapd
  mint-meta-codecs
  winff
  guvcview
  virtualbox
  flameshot
  nemo-dropbox
  steam-devices
  steam:i386
  ratbagd
  piper
  lutris
  libvulkan1
  libvulkan1:i386
  libgnutls30:i386
  libldap-2.4-2:i386
  libgpg-error0:i386
  libxml2:i386
  libasound2-plugins:i386
  libsdl2-2.0-0:i386
  libfreetype6:i386
  libdbus-1-3:i386
  libsqlite3-0:i386
)
# ---------------------------------------------------------------------- #

#RASCUNHO
#$HOME/Downloads/programas