Vagrant.configure("2") do |config|

  proxy = if ENV.has_key?("HTTP_PROXY")
            ENV["HTTP_PROXY"]
            elsif ENV.has_key?("http_proxy")
            ENV["http_proxy"]
            end

  if Vagrant.has_plugin?("vagrant-proxyconf") && ( proxy != nil && !proxy.empty? )
    config.proxy.http     = proxy
    config.proxy.no_proxy = "localhost,127.0.0.1,192.168."
  end

  config.vm.synced_folder "..", "/home/vagrant/wspace", mount_options: ["dmode=775,fmode=664"]
  config.vm.synced_folder "Y:/", "/home/vagrant/wspace-132", mount_options: ["dmode=775,fmode=664"]
  config.vm.box = "box-cutter/ubuntu1404-desktop"
  config.vm.hostname = "workmachine"
  config.vm.network :public_network, ip: "192.168.92.99", netmask: "255.255.0.0"
  config.vm.provider "virtualbox" do |v|
	v.gui = true
	v.memory = 12*1024
	v.cpus = 4
  end
  config.vm.provision "ansibleInstaller", type: "shell", path: "provision/install-ansible.sh"
  config.vm.provision "playbooksInstaller", type: "shell", path: "provision/install-playbook-dependencies.sh"
  config.vm.provision "playbookRunner", type: "shell", path: "provision/run_playbook.sh"
end