#!/usr/bin/env bash

ip=$1
echo $ip

fullname=full-$ip.txt
udpname=udp-top20-$ip.txt
vulnname=vuln-$ip.txt
svscname=scsv=$ip.txt

#tcp - full scan
echo "Full tcp scan"
nmap -Pn -p- --max-retries 1 --max-rate 500 --max-scan-delay 20 -T4 -oN $fullname $ip

echo "UDP scan"
sudo nmap -Pn -sU --top-ports 20 --max-retries 1 --open -oN $udpname $ip

echo "Vulnscan"
nmap -Pn --script vuln -oN $vulnname $ip

echo "Service scan"
nmap -sC -sV -oN $svscname $ip