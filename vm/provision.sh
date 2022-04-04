#!/usr/bin/env bash

set -o errexit
set -o nounset

export DEBIAN_FRONTEND=noninteractive

echo "Provisioning virtual machine..."

echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8

apt-get update
apt-get install software-properties-common
add-apt-repository ppa:ondrej/php
apt-get update
apt-get upgrade -y

# general packages
apt-get install -y \
  make \
  ntp \
  git \
  vim \
  tmux \
  zip \
  unzip \
  htop \
  nginx \
  ghostscript \
  gdebi \
  ttf-mscorefonts-installer \
  python-pip

# pdftk packages
apt install -y \
  default-jre-headless \
  libcommons-lang3-java \
  libbcprov-java

# node js install
apt-get update
curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install -y build-essential

if [ ! -d /var/bak ]; then
    mkdir -p /var/bak
    mv /etc/nginx/nginx.conf /var/bak/nginx.conf
    mv /etc/nginx/sites-available/default /var/bak/default
fi

rm -f /etc/nginx/nginx.conf
rm -f /etc/nginx/sites-available/default
rm -f /etc/nginx/sites-enabled/default

cp /vagrant/vm/nginx.conf /etc/nginx/nginx.conf
cp /vagrant/vm/nginx-react-app.conf /etc/nginx/sites-available/nginx-react-app.conf
cp /vagrant/vm/nginx-node-app.conf /etc/nginx/sites-available/nginx-node-app.conf

ln -s /etc/nginx/sites-available/nginx-react-app.conf /etc/nginx/sites-enabled/nginx-react-app.conf
ln -s /etc/nginx/sites-available/nginx-node-app.conf /etc/nginx/sites-enabled/nginx-node-app.conf


service nginx restart
service supervisor restart

echo "Finished!"


