#! /bin/bash
echo "LABEL=home              /home    ext4   defaults                0 0" >> /etc/fstab
mount -a
apt-get update
apt-get install -y zsh gcc
apt-get install -y mosh
apt-get install -y make
timedatectl set-timezone CET
