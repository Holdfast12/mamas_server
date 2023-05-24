# -*- mode: ruby -*-
# vi: set ft=ruby :

MACHINES = {
    :mamasserver => {
        :box_name => "archlinux/archlinux",
        :ip_addr => '192.168.0.3',
        :guest_port1 => '80',
        :host_port1 => '8080'
    },
}
 

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.ssh.private_key_path = ['id_rsa', '~/.vagrant.d/insecure_private_key']
  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|
        config.vm.box_check_update = false
        config.vm.box = boxconfig[:box_name]
        config.vm.provider :virtualbox do |vb|
          vb.memory = 4096
          vb.cpus = 2
          vb.customize [
            "modifyvm", :id,
            "--graphicscontroller", "vmsvga",
            "--vram", "128",
            "--ioapic", "on",
            "--audioout", "on",
            "--audio", "alsa",
            "--audiocontroller", "hda"
          ]
        config.vm.synced_folder "/home/michael/pacman_cache", "/var/cache/pacman/pkg/"
        end
        box.vm.host_name = boxname.to_s
        box.vm.provision "shell", inline: <<-SHELL
          pacman -Syu --noconfirm
          pacman -S python --noconfirm
          SHELL
        box.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/playbook.yml"
        end
    end
  end
end