# bash_gitlab_runners

Repo con scripts y notas para desplegar un servidor Gitlab + crear de runners y administrarlos.

Testeado con [Vagrant](https://developer.hashicorp.com/vagrant/install) + [Qemu](https://www.qemu.org/download/#linux) + [Ubuntu](https://ubuntu.com/download/desktop) + [Docker](https://docs.docker.com/desktop/setup/install/linux/ubuntu/)

---

### Descripción

El proyecto cuenta con los scripts necesarios para automatizar el despliegue de un Servidor [Gitlab](https://about.gitlab.com/es/install/) + gitlab [runners](https://docs.gitlab.com/runner/install/) para ejecutar tareas de CI/CD.

---

### Uso:
```shell
git clone https://github.com/pgraffigna/bash_gitlab_runners
cd bash_gitlab_runners
vagrant up
vagrant upload install_gitlab-ce.sh
vagrant ssh 
chmod +x install_gitlab-ce.sh
./install_gitlab-ce.sh
```

### Scripts:
- gitlab-ci.yml
- gitlab-ci-kaniko.yml
- install_gitlab-ce.sh
- install_gitlab_runners.sh
- deploy_runners.sh

### Extras:
- Vagrantfile: *Archivo de configuración para desplegar una VM descartable con ubuntu-22.04 con libvirt como hipervisor.*
- config_docker_registry.md: *Notas sobre la configuración de un registro de contenedores local.*
- config_gitlab_ldap.md: *Notas sobre la implementación de ldap para validar la autenticación en gitlab.*
- sample-config.toml: *Archivo de configuración de los gitlab runners.*
