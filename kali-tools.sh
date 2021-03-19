#!/usr/bin/env bash
# A list of tool to install in kali
cd && sudo apt update
#leafpad and nano
sudo apt install -y leafpad nano open-vm-tools open-vm-tools-desktop
#lib for gcc compilation
sudo apt-get install -y gcc-9-base libgcc-9-dev libc6-dev
sudo apt-get install -y git git-core
sudo apt-get install -y gcc-multilib
sudo apt-get install -y bindfs
sudo apt-get install -y tigervnc-viewer
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
sudo apt install -y powershell-empire powershell
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
sudo apt install -y john bruteforce-salted-openssl gospider ffuf feroxbuster

# some re-install just in case
sudo apt install -y remmina filezilla nasm #
sudo apt install -y seclists curl enum4linux gobuster nbtscan nikto nmap onesixtyone oscanner nishang
sudo apt install -y smbclient smbmap smtp-user-enum snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
sudo apt install -y jq
sudo apt-get install -y hashcat
sudo apt-get install -y bloodhound
sudo apt install -y crackmapexec
sudo apt install -y ruby
sudo apt install -y kerberoast
sudo apt install -y dnsutils altdns
sudo apt install -y rinetd xrdp libnet-vnc-perl unzip tcpdump crowbar
# Error - sudo apt install -y realvnc x2go autorecon grabber hashcatsudo 
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
sudo apt-get install -y virtualenvwrapper python3-yaml
sudo apt-get install -y python3-venv python3-impacket impacket-scripts python3-shodan python3-crypto libpython3-dev python3-xlrd python-xlrd-docs

python3 -m pip install --user pipx

#adding the pipx path to
echo "--------------------------------------------------------------------"
echo "Use the following command to if pipx fails"
echo '#export PATH=~/.local/bin/:$PATH >> .zshrc && source .zshrc'
echo "--------------------------------------------------------------------"
pipx install witnessme
pipx install git+https://github.com/Tib3rius/AutoRecon.git
sudo gem install bundler
sudo gem install evil-winrm
sudo gem install wpscan

sudo apt autoremove -y
#Intall if needed
echo "---- Install/upgrade if needed -------------------------------------"
echo "#sudo apt install -y metasploit-framework && sudo msfdb reinit"
echo "--------------------------------------------------------------------"
