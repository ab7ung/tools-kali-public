#!/usr/bin/env bash
# A list of tool to install in kali
sudo apt update
#leafpad and nano
sudo apt install -y leafpad nano
#lib for gcc compilation
sudo apt-get install -y gcc-9-base libgcc-9-dev libc6-dev

sudo apt-get install -y gcc-multilib

sudo apt install -y libpango1.0-0
#python and perl
sudo apt-get install -y python-dev build-essential python-setuptools virtualenvwrapper python3-pip

sudo apt-get install -y libwww-perl libdbd-sqlite3-perl libhtml-linkextractor-perl

sudo apt-get install -y libterm-readline-gnu-perl liblwp-protocol-socks-perl sqlite3 libswitch-perl

sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential python3-venv perl-doc
# paramiko package
sudo apt-get install -y python3-paramiko
# xclip
sudo apt-get install -y xclip
# git tor ncat nfs-common and telnel
sudo apt install -y git tor telnet nfs-common ncat
# net-tool and dos2unix
sudo apt install -y net-tools dos2unix
# Incase nikto is missing in Kali
sudo apt install -y nikto
# Empire framework
sudo apt install -y powershell-empire
# Domain sublister
sudo apt install -y sublist3r
# Screenshot grabbing tool, pass the output from sublist3r to eyewitness
sudo apt install -y eyewitness
# nis tool
sudo apt-get install -y  nis # accept te domain
#sqlsus
sudo apt-get install -y sqlsus
# dnsrecon
sudo apt install -y dnsrecon
# Openvpn
sudo apt install -y openvpn
# john and hashcat
sudo apt install -y john
# gospider ffuf
sudo apt install -y gospider
sudo apt install -y ffuf

# some re-install just in case
sudo apt install -y remmina filezilla nasm #
sudo apt install -y seclists curl enum4linux gobuster nbtscan nikto nmap onesixtyone oscanner 
sudo apt install -y smbclient smbmap smtp-user-enum snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
sudo apt install -y jq
sudo apt install -y metasploit-framework
sudo apt-get install -y hashcat  
sudo apt-get install -y bloodhound
sudo apt install -y crackmapexec 
sudo apt install -y ruby
sudo apt install -y kerberoast
sudo apt install -y metasploit-framework 
sudo apt update
# Error - sudo apt install -y realvnc x2go autorecon grabber hashcatsudo 

sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
sudo apt-get install -y virtualenvwrapper



