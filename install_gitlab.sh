#!/bin/bash
# instrucciones para instalar en ubuntu-focal

VERSION=15.4.2
GITLAB_URL="https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/focal/gitlab-ce_${VERSION}-ce.0_amd64.deb/download.deb"
DEB="gitlab-ce_${VERSION}.deb"

# descargar gitlab
wget -q --show-progress --progress=bar:force 2>&1 "${GITLAB_URL}" -O "/tmp/${DEB}"

# instalar deb
sudo dpkg -i "/tmp/${DEB}"
