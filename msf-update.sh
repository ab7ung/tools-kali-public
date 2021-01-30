#!/usr/bin/env bash
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755  msfinstall
./msfinstall
msfdb init
echo "Msf installation done"
