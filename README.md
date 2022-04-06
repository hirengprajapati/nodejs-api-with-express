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

## Install Mysql

```
sudo apt-get update
sudo apt-get install mysql-server

/etc/mysql/mysql.conf.d/mysqld.cnf
bind-address        = 0.0.0.0 ( All ip addresses. )
sudo systemctl restart mysql

/etc/ssh/sshd_config
PasswordAuthentication yes
sudo service ssh restart

vagrant ssh
mysql
CREATE USER 'node'@'localhost' IDENTIFIED BY 'node@123';
GRANT ALL PRIVILEGES ON * . * TO 'crm'@'localhost';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS `nodeapi`;

```
```
vagrant ssh
cd /vagrant/nodeapi
npm install --no-bin-links
config.json // add credentials
npm start
api documentation : http://localhost:8002/api-docs/  OR  http://192.168.50.50:3000/api-docs/
```