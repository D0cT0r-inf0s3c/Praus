#!/bin/bash

# Install iptables
apt -y install iptables

# Install iptables-persistent
apt -y install iptables-persistent
systemctl enable netfilter-persistent

# Flush/Delete firewall rules
iptables -F
iptables -X
iptables -Z

# Βlock null packets (DoS)
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Block syn-flood attacks (DoS)
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Block XMAS packets (DoS)
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Allow internal traffic on the loopback device
iptables -A INPUT -i lo -j ACCEPT

# Allow ssh access
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# Allow established connections
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing connections
iptables -P OUTPUT ACCEPT

# Set default deny firewall policy
iptables -P INPUT DROP

# Save rules
iptables-save > /etc/iptables/rules.v4
