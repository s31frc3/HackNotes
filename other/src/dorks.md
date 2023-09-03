# links
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

# 2
dork: domain[.]com secret NOT www (subdomains)

site:target.com inurl:admin | administrator | adm | login | l0gin | wp-login

intitle:"login" "admin" site:target.com

intitle:"index of /admin" site:target.com

inurl:admin intitle:admin intext:admin

2. Используя httpx (https://github.com/projectdiscovery/httpx) и список слов (https://github.com/emadshanab/admin-login/blob/main/admin-login.txt):

httpx -l hosts.txt -paths /root/admin-login.txt -threads 100 -random-agent -x GET,POST  -tech-detect -status-code -follow-redirects -title -content-length

httpx -l hosts.txt-ports 80,443,8009,8080,8081,8090,8180,8443 -paths /root/admin-login.txt -threads 100 -random-agent -x GET,POST -tech-detect -status-code -follow-redirects -title -content-length

httpx -l targets.list -p 8080,10000,20000,2222,7080,9009,7443,2087,2096,8443,4100,2082,2083,2086,9999,2052,9001,9002,7000,7001,8082,8084,8085,8010,9000,2078,2080,2079,2053,2095,4000,5280,8888,9443,5800,631,8000,8008,8087,84,85,86,88,10125,9003,7071,8383,7547,3434,10443,8089,3004,81,4567,7081,82,444,1935,3000,9998,4433,4431,4443,83,90,8001,8099,80,300,443,591,593,832,981,1010,1311,2480,3128,3333,4243,4711,4712,4993,5000,5104,5108,6543,7396,7474,8014,8042,8069,8081,8088,8090,8091,8118,8123,8172,8222,8243,8280,8281,8333,8500,8834,8880,8983,9043,9060,9080,9090,9091,9200,9800,9981,12443,16080,18091,18092,20720,28017 -o livesites.result

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

---

# 3
### search admin-panels
```
site:target.com inurl:admin | administrator | adm | login | l0gin | wp-login

intitle:"login" "admin" site:target.com

intitle:"index of /admin" site:target.com

inurl:admin intitle:admin intext:admin
```

---

# 4
 Некоторые способы поиска админ-панелей компании | Привет, друг. На связи Эллиот.

1. Используя Google дорки:

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
# 5
— Вот вам небольшая коллекция утилит и ссылок на списки дорков (https://github.com/cipher387/Dorks-collections-list/) для различных инструментов поиска.

Google, Bing, Ecosia, Yahoo или Yandex
https://github.com/Zarcolio/sitedorks

Google Dorks:
https://github.com/BullsEye0/google_dork_list
https://github.com/sushiwushi/bug-bounty-dorks
https://github.com/rootac355/SQL-injection-dorks-list
https://github.com/unexpectedBy/SQLi-Dork-Repository
https://github.com/thomasdesr/Google-dorks
https://github.com/arimogi/Google-Dorks
https://github.com/aleedhillon/7000-Google-Dork-List

DuckDuckGo dorks
https://github.com/d34dfr4m3/goDuck

Github Dorks:
https://github.com/techgaun/github-dorks
https://github.com/jcesarstef/ghhdb-Github-Hacking-Database
https://github.com/H4CK3RT3CH/github-dorks

Shodan Dorks:
https://github.com/humblelad/Shodan-Dorks
https://github.com/AustrianEnergyCERT/ICS_IoT_Shodan_Dorks
https://github.com/lothos612/shodan
https://github.com/jakejarvis/awesome-shodan-queries
https://github.com/IFLinfosec/shodan-dorks

Virus Total Dorks:
https://github.com/Neo23x0/vti-dorks

Binary Edge + Shodan + Google:
https://github.com/iGotRootSRC/Dorkers
# 6
Поиск открытых веб-камер

Ниже представлена небольшая подборка Google дорков для поиска открытых веб-камер:

```
allintitle: "Network Camera NetworkCamera" 

intitle:"EvoCam" inurl:"webcam.html" 

intitle:"Live View / - AXIS"

intitle:"LiveView / - AXIS" | inurl:view/view.shtml

intitle:"Live View / - AXIS" | inurl:/mjpg/video.mjpg?timestamp

inurl:axis-cgi/jpg

inurl:"MultiCameraFrame?Mode=Motion" 

inurl:/view.shtml 

inurl:/view/index.shtml 

"my webcamXP server!"
```