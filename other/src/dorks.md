[back](/HackNotes/README.md)
* [GitDocker](https://github.com/obheda12/GitDorker)
* [Katana](https://github.com/TebbaaX/Katana)
* [Fast-Google-Dorks-Scan](https://github.com/IvanGlinkin/Fast-Google-Dorks-Scan)
* [oxdork](https://github.com/rly0nheart/oxdork)
* [SDorker](https://github.com/TheSpeedX/SDorker)
* [pagodo](https://github.com/opsdisk/pagodo)
* [dorks-eye](https://github.com/BullsEye0/dorks-eye)
* [GooFuzz](https://github.com/m3n0sd0n4ld/GooFuzz)(Google Dorks)
* [Agnee](https://github.com/R0X4R/Agnee)

Online tools:
* [Dorksearch](https://dorksearch.com/)
* [FilePhish](https://cartographia.github.io/FilePhish/)
* [Bug Bounty Helper](https://dorks.faisalahmed.me/)
* [Pentest-tools google-hacking](https://pentest-tools.com/information-gathering/google-hacking)

git dorcks
site.com filename:wp-config.php


---

site:target.com inurl:admin | administrator | adm | login | l0gin | wp-login

intitle:"login" "admin" site:target.com

intitle:"index of /admin" site:target.com

inurl:admin intitle:admin intext:admin

2. Используя httpx (https://github.com/projectdiscovery/httpx) и список слов (https://github.com/emadshanab/admin-login/blob/main/admin-login.txt):

httpx -l hosts.txt -paths /root/admin-login.txt -threads 100 -random-agent -x GET,POST  -tech-detect -status-code -follow-redirects -title -content-length

httpx -l hosts.txt-ports 80,443,8009,8080,8081,8090,8180,8443 -paths /root/admin-login.txt -threads 100 -random-agent -x GET,POST -tech-detect -status-code -follow-redirects -title -content-length

3. Используя утилиты:

🗄 https://github.com/the-c0d3r/admin-finder
🗄 https://github.com/RedVirus0/Admin-Finder
🗄 https://github.com/mIcHyAmRaNe/okadminfinder3
🗄 https://github.com/penucuriCode/findlogin
🗄 https://github.com/fnk0c/cangibrina

4. Используя поисковые системы:

Shodan (https://www.shodan.io/):

ssl.cert.subject.cn:"company.com" http.title:"admin"

ssl:"company.com" http.title:"admin"

ssl.cert.subject.cn:"company.com" admin

ssl:"company.com" admin

Fofa (https://fofa.so/):

cert="company.com" && title="admin"

cert.subject="company" && title="admin"

cert="company.com" && body="admin"

cert.subject="company" && body="admin"

ZoomEye (https://www.zoomeye.org/):

ssl:company.com +title:"admin"

ssl:company.com +admin

Censys (IPv4 (https://censys.io/ipv4)):

(services.tls.certificates.leaf_data.issuer.common_name:company.com) AND services.http.response.html_title:admin

(services.tls.certificates.leaf_data.issuer.common_name:company.com) AND services.http.response.body:admin