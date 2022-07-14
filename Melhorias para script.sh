#!/usr/bin/env bash
Install manual
instalação do teams (DEB)

Install gestor pacotes
instalação do teams (FLATPACK)

#curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'


instalação do edge 
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg

instalaçao do brave
instalação do teams
instalação do musescore
instação do virtualbox
instalação do office (wps office ou onyoffice) ainda decidir e escolher 

o que remover