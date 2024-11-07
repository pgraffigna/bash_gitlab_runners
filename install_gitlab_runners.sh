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
        echo -e "\n${ROJO}=== Programa Terminado por el usuario ===${FIN}"
        exit 0
}

# variables
GIT_RUNNER_URL="https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

echo -e "${AMARILLO}=== Instalando docker ===${FIN}"
sudo apt update && sudo apt install -y docker.io

echo -e "${AMARILLO}=== Configurando usuario para docker ===${FIN}"
sudo usermod -aG docker vagrant && sudo newgrp docker

echo -e "${AMARILLO}=== Descargando gitlab-runner ===${FIN}"
sudo curl -sL "${GIT_RUNNER_URL}" --output /usr/local/bin/gitlab-runner

echo -e "${AMARILLO}=== Cambiando permisos ===${FIN}"
sudo chmod +x /usr/local/bin/gitlab-runner

echo -e "${AMARILLO}=== Creando usuario para los runners ===${FIN}"
sudo useradd --comment 'usuario gitlab runner' --create-home gitlab-runner --shell /bin/bash

echo -e "${AMARILLO}=== Instalando servicio + Iniciando ===${FIN}"
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner && sudo gitlab-runner start
