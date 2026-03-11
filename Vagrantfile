ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "alvistack/ubuntu-24.04"

SERVER = "gitlab.home.local"
SERVER_IP = "192.168.121.10"

RUNNER = "runner.home.local"
RUNNER_IP = "192.168.121.20"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", type: "rsync", disabled: true

  # server
  config.vm.define :server do |s|
    s.vm.box = IMAGEN
    s.vm.hostname = SERVER
    s.vm.network "private_network", ip: SERVER_IP

    s.vm.provision "shell", inline: <<-SHELL
    echo "#{RUNNER_IP} #{RUNNER} runner" >> /etc/hosts
    SHELL

    s.vm.provider :libvirt do |v|
      v.disk_bus = 'virtio'
      v.memory = 4096
      v.cpus = 2
      v.graphics_type = 'none'
    end
  end

  # runner
  config.vm.define :runner do |r|
    r.vm.box = IMAGEN
    r.vm.hostname = RUNNER
    r.vm.network "private_network", ip: RUNNER_IP
    r.vm.provision :docker

    r.vm.provision "shell", inline: <<-SHELL
    echo "#{SERVER_IP} #{SERVER} server" >> /etc/hosts
    SHELL

    r.vm.provider :libvirt do |v|
      v.disk_bus = 'virtio'
      v.memory = 2048
      v.cpus = 2
      v.graphics_type = 'none'
    end
  end
end
