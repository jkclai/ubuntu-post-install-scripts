#!/bin/bash

# change the working directory to home
cd

# change permissions of /opt
sudo chown -R $USER:$USER /opt/

# enable uncomplicated firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# update and upgrade from apt
sudo apt update
sudo apt -y upgrade

# install packages from apt
sudo apt -y install ofono pavucontrol ubuntu-desktop ubuntu-restricted-extras ibus-chewing tlp tlp-rdw \
    linux-tools-$( uname -r ) lm-sensors hddtemp \
    gnome-tweaks gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell \
    build-essential pkg-config gcc python3-dev python3-pip default-jre default-jdk golang-go git csh tcsh tree nano xdotool grabc

# install programs in applications folder
for s in ./applications/*.sh; do
    bash $s
done