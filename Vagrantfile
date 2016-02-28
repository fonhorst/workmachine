Vagrant.configure("2") do |config|
  config.vm.synced_folder "..", "/home/vagrant/wspace"
  config.vm.box = "box-cutter/ubuntu1404-desktop"
  config.vm.hostname = "workmachine"
  config.vm.network :private_network, ip: "192.168.0.42"
  config.vm.provider "virtualbox" do |v|
	v.gui = true
  end
  config.vm.provision "shell", path: "provision/install-ansible.sh"
  config.vm.provision "shell", path: "provision/install-playbook-dependencies.sh"
  config.vm.provision "shell", path: "provision/run_playbook.sh"
end