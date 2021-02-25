#!/usr/bin/env bash
sudo apt-get install -y git git-core
#download smbcry exploits
git clone https://github.com/joxeankoret/CVE-2017-7494
git clone https://github.com/andyacer/ms08_067.git
git clone https://github.com/3ndG4me/AutoBlue-MS17-010

git clone https://github.com/trailofbits/winchecksec.git
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git
git clone https://github.com/PowerShellMafia/PowerSploit.git

git clone https://github.com/AlessandroZ/BeRoot.git

git clone https://github.com/FuzzySecurity/PowerShell-Suite.git

git clone https://github.com/mgeeky/tomcatWarDeployer.git

git clone https://github.com/D35m0nd142/LFISuite.git

git clone https://github.com/EmpireProject/Empire.git

git clone https://github.com/Seabreg/pwdump.git
git clone https://github.com/CiscoCXSecurity/creddump7.git
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

git clone https://github.com/maurosoria/dirsearch.git

git clone https://github.com/immunIT/drupwn.git

git clone https://github.com/SecWiki/windows-kernel-exploits.git

git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/b374k/b374k.git

#cms scanner and exploitation
git clone https://github.com/Tuhinshubhra/CMSeeK
#git clone https://github.com/Dionach/CMSmap


#printer exploitation
git clone https://github.com/RUB-NDS/PRET.git

#nmapAutomator
wget https://raw.githubusercontent.com/21y4d/nmapAutomator/master/nmapAutomator.sh && chmod 755 nmapAutomator.sh
wget https://raw.githubusercontent.com/Ogglas/Orignal-Slowloris-HTTP-DoS/master/slowloris.pl && chmod 755 slowloris.pl
wget https://raw.githubusercontent.com/brokensound77/OptionsBleed-POC-Scanner/master/bleeder.py && chmod 755 bleeder.py

#findmyhash - find the hash of password for cracking across multiple sites
wget https://raw.githubusercontent.com/frdmn/findmyhash/master/findmyhash.py && chmod 755 findmyhash.py

#encode-explorer.php
wget https://raw.githubusercontent.com/marekrei/encode-explorer/master/index.php

### Corelan scripts
wget https://raw.githubusercontent.com/corelan/mona/master/mona.py && chmod 755 mona.py
wget https://raw.githubusercontent.com/corelan/Scripts/master/winappdbgtest.py && chmod 755 winappdbgtest.py
wget https://raw.githubusercontent.com/corelan/Scripts/master/hex2bin.py && chmod 755 hex2bin.py
wget https://raw.githubusercontent.com/corelan/Scripts/master/bin2hex.py && chmod 755 bin2hex.py

### Git finder, git-extractor and dumper
wget https://raw.githubusercontent.com/internetwache/GitTools/master/Finder/gitfinder.py && chmod 755 gitfinder.py

wget https://raw.githubusercontent.com/internetwache/GitTools/master/Extractor/extractor.sh && chmod 755 extractor.sh
mv extractor.sh git-extractor.sh

wget https://raw.githubusercontent.com/internetwache/GitTools/master/Dumper/gitdumper.sh && chmod 755 gitdumper.sh
#Reverse shell
wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php
#no sql user pass enum
wget https://raw.githubusercontent.com/an0nlk/Nosql-MongoDB-injection-username-password-enumeration/master/nosqli-user-pass-enum.py

#some specific files for exploits
wget https://raw.githubusercontent.com/BuddhaLabs/PacketStorm-Exploits/master/0304-exploits/ptrace-kmod.c

#jsp file browser
wget http://www.vonloesch.de/files/browser.zip
mv browser.zip jsp-file-browser.zip

# Windows priv checker
wget https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe
wget https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1
wget https://raw.githubusercontent.com/AonCyberLabs/Windows-Exploit-Suggester/master/windows-exploit-suggester.py && chmod 755 windows-exploit-suggester.py
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/Get-System.ps1
wget https://raw.githubusercontent.com/enjoiz/Privesc/master/privesc.ps1

#Linux priv checker
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

wget https://raw.githubusercontent.com/Anon-Exploiter/SUID3NUM/master/suid3num.py --no-check-certificate && chmod 755 suid3num.py

wget https://raw.githubusercontent.com/pentestmonkey/unix-privesc-check/master/upc.sh && chmod 755 upc.sh
wget https://raw.githubusercontent.com/sleventyeleven/linuxprivchecker/master/linuxprivchecker.py && chmod 755 linprivchecker.py
wget https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh && chmod 755 lse.sh

wget https://github.com/zricethezav/gitleaks/releases/download/v7.2.0/gitleaks-linux-amd64
wget https://raw.githubusercontent.com/jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl && chmod 755 linux-exploit-suggester-2.pl

#pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64s
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32

wget http://download.sysinternals.com/files/SysinternalsSuite.zip
