#!/usr/bin/env bash
#
# Autor: Pablo Graffigna
# URL: www.linkedin.com/in/pablo-graffigna
#
set -e

# colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# ctrl-C
trap ctrl_c INT
function ctrl_c(){
        echo -e "\n${ROJO}=== Programa Terminado por el usuario ===${END}"
        exit 0
}

# variables
VERSION="17.3.6"
GITLAB_URL="https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/jammy/gitlab-ce_${VERSION}-ce.0_amd64.deb/download.deb"

echo -e "${AMARILLO}=== Descargando GitLab ===${FIN}"
wget -q --show-progress --progress=bar:force 2>&1 "${GITLAB_URL}" -O "/tmp/gitlab-ce_${VERSION}.deb"

echo -e "${AMARILLO}=== Instalando GitLab ===${FIN}"
sudo apt-get install -y "/tmp/gitlab-ce_${VERSION}.deb"