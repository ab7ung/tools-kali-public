# tools-kali-public - repo
## A collection of all the tools (kali and python)

### kali-tools.sh - install all the tools and update to latest versions
- sh kali-tools.sh

#### git tools list in one go, select one folder and execute the script. Later add the path in env var
- sh git-tools-install.sh 

### py env setup a collection of the py env

##### Python2
- cd /home/kali
- sh pygetpip.sh or curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python2 get-pip.py
- virtualenv -p python2 py2env
- source py2env/bin/activate
- sh py2envtools.sh
- deactivate

##### Python3
- cd /home/kali
- virtualenv -p python3 py3env
- source py3env/bin/activate
- sh py3envtools.sh
- deactivate

#### nmap common scans
- sh custom-nmap-scan.sh <ip>

### smb server script for tranfers for files
- sh create-smb-server.sh

### Buffer Overflow from Tib3rius
- buffer-overflow.md
- python gen-badchar-array.py

### Linux Priv Esc techniques 
- linux-priv-esc.md

### Windows Priv Esc techniques
- under dev
