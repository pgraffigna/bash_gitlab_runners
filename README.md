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

---

### Scripts:
- 00-install_gitlab-ce.sh
- 01-install_gitlab_runners.sh
- 02-deploy_runners.sh

---

### Extras:
- Vagrantfile: *Archivo de configuración para desplegar una VM descartable con ubuntu-22.04 con libvirt como hipervisor.*
- sample-config.toml: *Archivo de configuración de los gitlab runners.*
- AGENTS.md: *resumen de opencode sobre el repositorio*

---

### Notas sobre configuracion de docker registry en gitlab-ce:
```shell
# configurar registro docker local (en server)
editar /etc/gitlab/gitlab.rb
- registry_external_url 'http://gitlab.home.local:5000'
- registry['enable'] = true
- registry['registry_http_addr'] = "0.0.0.0:5000"
- registry_nginx['enable'] = false

# aplicar los cambios
gitlab-ctl reconfigure
gitlab-ctl restart

# configurar el runner para que pueda acceder al registry
editar /etc/docker/daemon.json

    {
    "insecure-registries" : ["gitlab.cultura.local:5000"]
    }

systemctl restart docker.service
```

