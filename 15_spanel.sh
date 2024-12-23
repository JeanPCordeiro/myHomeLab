#!/bin/bash
set -o xtrace

sudo apt install -y nodejs npm lm-sensors
git clone https://github.com/tjaworski/AceMagic-S1-LED-TFT-Linux.git acemagic
cd acemagic/s1panel
./install
cp ../../config.json .
mkdir themes/pve_panel
cp ../../pve_panel.json themes/pve_panel/.
sleep 2
sudo systemctl enable --now s1panel
sudo systemctl status s1panel
git rm -f --cached acemagic
