#! /bin/bash
DISK="/dev/$(which lsblk >/dev/null && lsblk  | grep 100G | awk '{print $1}' || echo "xvdh")"
sudo mount $DISK /home
sudo apt-get update
sudo apt-get install -y zsh gcc
sudo apt-get install -y mosh
sudo timedatectl set-timezone CET
