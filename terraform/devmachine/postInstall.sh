#! /bin/bash
sudo apt-get update
sudo apt-get install -y zsh gcc
sudo apt-get install -y mosh
sudo mount /dev/xvdh /home
sudo timedatectl set-timezone CET
