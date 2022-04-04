## Virtual Machine for development

* make sure VirtualBox is installed (https://www.virtualbox.org)
* make sure Vagrant is installed (http://www.vagrantup.com)
* open a terminal
* navigate to this repository
* execute the following commands and follow the instructions

```
vagrant up
vagrant ssh
sudo su
apt-get update
apt-get install dos2unix
cd /vagrant/vm
dos2unix provision.sh
cd /vagrant
bash vm/provision.sh
```

## Install vendors

```
vagrant ssh
cd /vagrant
composer install
```

*The provision script does this for you!*

sudo apt-get update
sudo apt-get install mysql-server

/etc/mysql/mysql.conf.d/mysqld.cnf
bind-address        = 0.0.0.0 ( All ip addresses. )
sudo systemctl restart mysql

/etc/ssh/sshd_config
PasswordAuthentication yes
sudo service ssh restart


CREATE USER 'crm'@'localhost' IDENTIFIED BY 'crm@123';
GRANT ALL PRIVILEGES ON * . * TO 'crm'@'localhost';
FLUSH PRIVILEGES;
