#!/bin/bash
set -o xtrace

#
# Install Fail2Ban, Net-Tools & iSCSI
#
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y fail2ban
sudo cp /etc/fail2ban/jail.{conf,local}
sudo sed -i 's/backend = auto/backend = systemd/' /etc/fail2ban/jail.local
sudo systemctl enable fail2ban.service --now
sudo systemctl restart fail2ban.service
sudo systemctl status fail2ban.service
sleep 2
sudo fail2ban-client status sshd

