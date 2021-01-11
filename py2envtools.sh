#!/usr/bin/env bash

#py2 env setup
echo "py2 env"

python -m pip install --upgrade pip
python2 -m pip install --upgrade pip
python2 -m pip install --upgrade pwntools

pip2 install requests impacket progress paramiko pycrypto 
pip2 install crackmapexec

pip2 install aclpwn

echo "done"
#python3 -m pip install requests
#pip install requests 
#pip3 install requests
#easy_install -U requests

