Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", type: "dhcp"
  config.ssh.forward_agent = true

  #config.vm.synced_folder "/www/storage/", "/var/storage/"

  config.vm.provider "virtualbox" do |v|
    v.name = "hp-react-with-nodeapi"
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.network "private_network", ip: "192.168.50.50"
  config.vm.network "forwarded_port", guest: 80, host: 8000 # web
  config.vm.network "forwarded_port", guest: 8001, host: 8001 # react app
  config.vm.network "forwarded_port", guest: 8002, host: 8002 # web node api
  config.vm.network "forwarded_port", guest: 8025, host: 8025 # Mail Hog
  config.vm.network "forwarded_port", guest: 9001, host: 9001 # Supervisor
end
