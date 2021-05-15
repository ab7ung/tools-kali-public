#!/usr/bin/env bash
#enter the py3 venv before executing
python -m pip install --upgrade pip
python3 -m pip install --upgrade pip

python3 -m pip install requests progress
pip3 install requests impacket progress paramiko pycrypto 
pip3 install drupwn droopescan dnspython argparse

pip3 install pysmb

python3 -m pip install --upgrade pwntools
pip3 install aclpwn
pip3 install raccoon-scanner
pip3 install slowloris
pip3 install crackmapexec
pip3 install -U oletools
pip3 install selenium fuzzywuzzy python-Levenshtein pyvirtualdisplay requests-toolbelt

pip3 install xlrd
pip3 install theHarvester
pip3 install cmsmap #cms scanner since droopescan doesnt work sometimes


# incase request give error, use following commands
#python3 -m pip install requests
#pip install requests 
#pip3 install requests
#easy_install -U requests
