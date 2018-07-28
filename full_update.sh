#!/bin/bash

#update apt and snap packages

sudo apt update
echo '---------- apt update complete'
sudo apt-get dist-upgrade
echo '---------- dist upgrade complete'
sudo apt autoremove
echo '---------- autoremove complete'
sudo apt autoclean
echo '---------- autoclean complete'
sudo snap refresh
echo '---------- snap refresh complete'
