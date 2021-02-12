#!/usr/bin/env bash
ip=$1
echo "Usage: ./custom-nmap-scan.sh <ip> | Current IP --->  $ip"

fullname=full-$ip.txt
fullname2=full2-$ip.txt
udpname=udp-$ip.txt
udpname20=udp20-$ip.txt
vulnname=vuln-$ip.txt
svscname=scsv-$ip.txt

now=$(date +"%T")
#tcp - full scan
echo "---> Full tcp scan started at $now"
#sudo nmap -Pn -p- --max-retries 1 --max-rate 500 --max-scan-delay 20 -T4 -oN $fullname $ip
sudo nmap -T4 -p- -n -vvv $ip --max-retries 1 -oN $fullname2
nmap_ports=$(cat $fullname2 | grep open | cut -d "/" -f 1 | tr -s "[:space:]" "," | sed 's/.$//');

now=$(date +"%T")
echo "---> UDP scan started at $now"
#sudo nmap -Pn -sU --top-ports 20 --max-retries 1 --open -oN $udpname $ip
sudo nmap -Pn -sU -vvv --top-ports 20 --max-retries 1 --open -oN $udpname20 $ip
sudo nmap -sU -p- --min-rate 10000 --open -oN $udpname $ip

now=$(date +"%T")
echo "---> Vulnscan  started at $now"
sudo nmap -Pn --script vuln -oN $vulnname $ip

now=$(date +"%T")
echo "---> Service scan  started at $now"
#sudo nmap -p- -sS -sC -sV --open --reason -oN $svscname $ip
sudo nmap -sV -sC -vvv -p ${nmap_ports} $ip -oN $svscname --open --reason

now=$(date +"%T")
echo "---> Scanned finished at $now"
