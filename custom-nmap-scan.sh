#!/usr/bin/env bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

ip=$1
#Please install rustscan to use this script
echo -e "${GREEN}Usage: ./custom-nmap-scan.sh <ip> | Current IP ---> ${RED} $ip ${NC}"

fullname=full-$ip.txt
fullname2=full2-$ip.txt
udpname=udp-$ip.txt
udpname20=udp20-$ip.txt
vulnname=vuln-$ip.txt
svscname=scsv-$ip.txt

now=$(date +"%T")
#tcp - full scan
echo -e "${GREEN}---> Full tcp scan (rustscan) started at $now ${NC}"
#sudo nmap -Pn -p- --max-retries 1 --max-rate 500 --max-scan-delay 20 -T4 -oN $fullname $ip
#sudo nmap -Pn -T4 -p- -n -vvv $ip --max-retries 1 -oN $fullname2
#nmap_ports=$(cat $fullname2 | grep open | cut -d "/" -f 1 | tr -s "[:space:]" "," | sed 's/.$//');
echo -e "Started scaning --> rustscan -a $ip -- -A -sC | tee rust-$ip.txt"
#rustscan 
rustports1=$(rustscan -a $ip -- -A -sC | tee rust-$ip.txt | grep "Open ")
cat rust-$ip.txt | grep "Open " > rust-$ip-ports.txt
#rustports2=$(cat rust-$ip.txt | grep "Open ")

nmap_ports=$(cat rust-$ip.txt | grep "Open " | cut -d":" -f2 | tr '\n' ',' | sed 's/.$//');

echo -e "${GREEN}Open ports"
cat rust-$ip-ports.txt
#echo -e $rustports1
echo -e  $nmap_ports "${NC}"

now=$(date +"%T")
echo -e "${GREEN}---> UDP scan started at $now ${NC}"
#sudo nmap -Pn -sU --top-ports 20 --max-retries 1 --open -oN $udpname $ip
sudo nmap -Pn -sU --top-ports 20 --max-retries 1 --open -oN $udpname20 $ip
sudo nmap -sU -p- --min-rate 10000 --open -oN $udpname $ip

now=$(date +"%T")
echo -e "${GREEN}---> Service scan  started at $now ${NC}"
#sudo nmap -p- -sS -sC -sV --open --reason -oN $svscname $ip
sudo nmap -sV -sC -p ${nmap_ports} $ip -oN $svscname --open --reason

now=$(date +"%T")
echo -e "${GREEN}---> Vulnscan  started at $now ${NC}"
sudo nmap -Pn --script vuln -oN $vulnname $ip -p ${nmap_ports}

now=$(date +"%T")
echo -e "${GREEN}---> Scanned finished at ${RED} $now ${NC}"
