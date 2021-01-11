# tools-kali-public - repo

## A collection of all the tools (kali and python)

### kali-tools.sh install all the tools and update to latest versions
- sh kali-tools.sh

### py env setup a collection of the py env

##### Python2
- cd /home/kali
- sh pygetpip.sh
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

#### nmap scaning common scans
Usage
- sh abzfscan.sh <ip>
