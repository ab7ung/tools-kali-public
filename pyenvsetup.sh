#!/usr/bin/env bash


# downlaod and install pip
if expr "" : 'Y' or 'y' >/dev/null; then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python2 get-pip.py
	rm -rf get-pip.py
else
	sleep 5
fi

### python3 is install with the command sudo apt install -y  python3-pip

sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
sudo apt-get install -y virtualenvwrapper

python2 -m pip install --upgrade pip
python2 -m pip install --upgrade pwntools

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

pip3 install progress
pip3 install raccoon-scanner
pipx install witnessme
pip3 install impacket



python3 -m pip install requests
pip install requests 
pip3 install requests
easy_install -U requests

python -m pip -V
python2 -m pip -V
python3 -m pip install --user pipx
pip2 install progress
pip2 install impacket pycrypto

python3 -m pip install --user pipx
sudo apt-get install python3-venv
pipx install git+https://github.com/Tib3rius/AutoRecon.git


pip install aclpwn