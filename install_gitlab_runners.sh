#!/bin/bash
# script para crear gitlab-runners

# variables
GIT_RUNNER_URL="https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

# instalando docker
sudo apt update && sudo apt install -y docker.io

# descargando binario
sudo curl -L "${GIT_RUNNER_URL}" --output /usr/local/bin/gitlab-runner

# agregando permisos de ejecución 
sudo chmod +x /usr/local/bin/gitlab-runner

# agregando usuario gitlab-runner
sudo useradd --comment 'usuario gitlab runner' --create-home gitlab-runner --shell /bin/bash

# instalando servicio gitlab-runner
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner && sudo gitlab-runner start
