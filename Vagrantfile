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