# configurar registro docker local (inseguro)
```shell
editar /etc/gitlab/gitlab.rb
- registry_external_url 'http://gitlab.cultura.local:5000'
- registry['enable'] = true
- registry['registry_http_addr'] = "0.0.0.0:5000"
- registry_nginx['enable'] = false
```
# aplicar los cambios
```shell
gitlab-ctl reconfigure
gitlab-ctl restart
```

# configurar runner para que pueda acceder al registro via http
```shell
editar /etc/docker/daemon.json 

    {
    "insecure-registries" : ["gitlab.cultura.local:5000"]
    }

systemctl restart docker.service
```
