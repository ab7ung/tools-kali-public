# tools-kali-public
## A collection of all the tools (kali and python)

### kali-tools.sh - install all the tools and update to latest versions
- sh kali-tools.sh

#### git tools list in one go, select one folder and execute the script. Later add the path in env var
- sh git-tools-install.sh 

### py venv setup

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

### smb server script for tranfers of files
- sh create-smb-server.sh

### Buffer Overflow from Tib3rius
- buffer-overflow.md
- python gen-badchar-array.py
- python2 bytearray.py '\x00' (same as mona, taken from https://gist.github.com/rverton/64589ac9f5c035100ab40501b17cdf63)

### Linux Priv Esc techniques 
- linux-priv-esc.md (original article - https://jieliau.medium.com/privilege-escalation-on-linux-platform-8b3fbd0b1dd4)

### Windows Priv Esc techniques
- under dev
