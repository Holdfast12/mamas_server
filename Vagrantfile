# -*- mode: ruby -*-
# vi: set ft=ruby :

MACHINES = {
    :mamasserver => {
        :box_name => "ubuntu/jammy64",
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
        box.vm.host_name = boxname.to_s
        #box.vm.network "private_network", ip: boxconfig[:ip_addr], netmask: "255.255.255.0", virtualbox__intnet: "otus"
        box.vm.network "public_network", bridge: 'wlp2s0'
        box.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/playbook.yml"
        end
    end
  end
end