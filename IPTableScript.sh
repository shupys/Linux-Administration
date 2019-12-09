#!/bin/bash

#opening HTTP ports

sudo iptables -A OUTPUT tcp --sport 80 -m conntrack --ctstate ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

#Opening HTTPS ports

sudo iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT tcp --sport 443 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Ports for MySQL

sudo iptables -A INPUT -p tcp --dport 3306 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 3306 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Allowing SSH

sudo iptables -A INPUT tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Email servers

sudo iptables -A INPUT tcp --dport 25 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT tcp --sport 25 -m conntrack --ctstate ESTABLISHED -j ACCEPT

#Blocking pings and specific IP Addresses

sudo iptables -A INPUT -p icmp --icmp-type echo-request -j REJECT

sudo iptables -A INPUT -m mac --mac-source 00:00:00:00:00:00 -j DROP

sudo iptables -A INPUT -p tcp --dport 23 -j REJECT

sudo iptables -A input -s 255.255.255.0 -j DROP

#saving and uploading rules to a text file

sudo iptables-save

sudo iptables -L -nv --line-number > iptablerules.txt
