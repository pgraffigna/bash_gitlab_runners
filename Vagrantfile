ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "generic/ubuntu2204"
HOSTNAME = "gitlab.home.local"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", type: "rsync", disabled: true

  config.vm.define :server do |s|
    s.vm.box = IMAGEN
    s.vm.hostname = HOSTNAME
    s.vm.box_check_update = false
    #s.vm.network "forwarded_port", guest: 80, host: 8000, host_ip: "*", gateway_ports: true

    s.vm.provider :libvirt do |v|
      v.disk_bus = 'virtio'
      v.memory = 4096
      v.cpus = 2
      v.graphics_type = 'none'
    end
  end
end