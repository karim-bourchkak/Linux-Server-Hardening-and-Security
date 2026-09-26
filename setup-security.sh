#!/bin/bash
# Hardening Script for Ubuntu Server

echo "[+] Updating Package Index..."
sudo apt update && sudo apt upgrade -y

echo "[+] Configuring UFW Firewall Rules..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 2222/tcp comment 'Custom SSH Port'
sudo ufw allow 80/tcp comment 'HTTP Web Service'
sudo ufw --force enable

echo "[+] Installing Fail2ban Intrusion Prevention..."
sudo apt install -y fail2ban
sudo systemctl enable --now fail2ban

echo "[+] Hardening Complete. UFW Status:"
sudo ufw status verbose
