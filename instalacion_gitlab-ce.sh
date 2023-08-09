#!/bin/bash

# colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# ctrl-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${rojo}Programa Terminado por el usuario ${end}"
        exit 0
}

# vars
VERSION="16.1.4"
GITLAB_URL="https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/focal/gitlab-ce_${VERSION}-ce.0_amd64.deb/download.deb"
DEB="gitlab-ce_${VERSION}.deb"

echo -e "${AMARILLO}Descargando GitLab ${FIN}"
wget -q --show-progress --progress=bar:force 2>&1 "${GITLAB_URL}" -O "/tmp/${DEB}"

echo -e "${AMARILLO}Instalando GitLab ${FIN}"
sudo apt install -y "/tmp/${DEB}"