#!/usr/bin/env bash

ip=$1

echo "Usage: ./custom-nmap-scan.sh <ip> | Current IP --->  $ip"

fullname=full-$ip.txt
udpname=udp-$ip.txt
udpname20=udp20-$ip.txt
vulnname=vuln-$ip.txt
svscname=scsv-$ip.txt

#tcp - full scan
echo "---> Full tcp scan"
sudo nmap -Pn -p- --max-retries 1 --max-rate 500 --max-scan-delay 20 -T4 -oN $fullname $ip

echo "---> UDP scan"
#sudo nmap -Pn -sU --top-ports 20 --max-retries 1 --open -oN $udpname $ip
sudo nmap -Pn -sU -vvv --top-ports 20 --max-retries 1 --open -oN $udpname20 $ip
sudo nmap -sU -p- --min-rate 10000 --open -oN $udpname $ip

echo "---> Vulnscan"
sudo nmap -Pn --script vuln -oN $vulnname $ip

echo "---> Service scan"
sudo nmap -p- -sS -sC -sV --open --reason -oN $svscname $ip
