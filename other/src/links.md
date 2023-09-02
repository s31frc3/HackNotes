[back](../../README.md)

---
# web OSINT
## CLI
- [httpx(pd)](https://github.com/projectdiscovery/httpx)
- [httpx ports](./src_for_src/httpx_ports.md)
- [naabu(pd)](https://github.com/projectdiscovery/naabu)(scan ports)
- [subchase](https://github.com/tokiakasu/subchase)(subdomains by analyzing search results from google and yandex)
- [subdominator](https://github.com/Edd13Mora/Subdominator)(One-Stop Solution for Subdomain Enumeration)
- [pdlist](https://github.com/gnebbia/pdlist)(passive subds enum)
- [shuffledns(pd)](https://github.com/projectdiscovery/shuffledns)(enumerate valid subdomains using active bruteforce)
- [subfinder(pd)](https://github.com/projectdiscovery/dnsx) (using passive online sources)
- [dnsx(pd)](https://github.com/projectdiscovery/dnsx)(DNS toolkit)
- [dnscan](https://github.com/rbsec/dnscan)(DNS subdomain scanner)
- [Garud](https://github.com/R0X4R/Garud)(scans sub-domains, sub-domain takeover and then filters out xss, ssti, ssrf and more)
- [pxurlfind3r](https://github.com/hueristiq/xurlfind3r)(find domain's known URLs from curated passive online sources)()https://en.wikipedia.org/wiki/Bluebugging
- [katana(pd)](https://github.com/projectdiscovery/katana)(urls)()https://en.wikipedia.org/wiki/Bluebugging
- [jsluice](https://github.com/BishopFox/jsluice)(for extracting URLs, paths, secrets, and other interesting data from JavaScript source code) [same](https://github.com/GerbenJavado/LinkFinder)[same in burp](https://portswigger.net/bappstore/0e61c786db0c4ac787a08c4516d52ccf)
- [jsmon](https://github.com/robre/jsmon)(Скрипт для мониторинга изменений в Javascript файлах)
- [photon](https://github.com/s0md3v/Photon)(Data Extraction of urls, emails, social media accounts, files, secret keys, js files,subds)
- [cdncheck(pd)](https://github.com/projectdiscovery/cdncheck)(what waf)
- [uncover](https://github.com/projectdiscovery/uncover)(discover exposed hosts on the internet only with api keys)
- [droopescan](https://github.com/SamJoan/droopescan)(scan for cms versions)
- [hakrawler](https://github.com/hakluke/hakrawler)(web crawler for gathering URLs and JavaScript file locations)
- [chameleon](https://github.com/iustin24/chameleon)(provides content discovery by using wappalyzer's set of technology fingerprints alongside custom wordlists tailored to each detected technologies)
- [changedetection.io](https://github.com/dgtlmoon/changedetection.io)(детектор обнаружения изменений на веб-сайтах с открытым исходным кодом)
- [hakip2host](https://github.com/hakluke/hakip2host)(takes a list of IP addresses via stdin, then does a series of checks to return associated domain names)
## online tools
- [nmmapper.com](https://www.nmmapper.com/sys/tools/subdomainfinder/)(online subds)
- [subdomain finder](https://subdomainfinder.c99.nl/)(online subds)
- [osint web all in one](https://web-check.as93.net/)
- [web-check](https://web-check.xyz/)
- [intelligence X](https://intelx.io/)
---
# tools

## cli
### web
- authorize (burp extension to scan for idor 1 1 | 2)
- param miner (burp extension to scan hidden params)
- [JIRA](./src_for_src/jira.md)(scaner)
- [NucleiFuzzer](https://github.com/0xKayala/NucleiFuzzer)
- [wordpress nuclei](https://github.com/topscoder/nuclei-wordfence-cve)
- [менеджер nuclei](https://github.com/xm1k3/cent)
- [nuclei templates generator](https://templates.nuclei.sh/)
- [check](https://api-guesser.netlify.app/) [api](https://github.com/streaak/keyhacks)
- [bypass disable_functions and open_basedir php](https://github.com/TarlogicSecurity/Chankro)
- [php-jpeg-injector](https://github.com/dlegs/php-jpeg-injector)
- [three](https://github.com/enjoiz/XXEinjector)| [tools](https://github.com/luisfontes19/xxexploiter)| [for xxe](https://github.com/whitel1st/docem)
- [headerpwn](https://github.com/devanshbatham/headerpwn)(A fuzzer for analyzing how servers respond to different HTTP headers)
- [http](https://webhook.site) [отстукивание](https://requestcatcher.com)
- [xss-vibes](https://github.com/faiyazahmad07/xss_vibes)(automates your xss findings)
- [sqlifinder](https://github.com/americo/sqlifinder)(detecting GET-based sql injection vulnerabilities in web applications using waybackurls, web crawlers and sql injection payloads)
- [Logsensor](https://github.com/Mr-Robert0/Logsensor)(discover login panels, and POST Form SQLi Scanning)
### other
- [fast port scanner](https://github.com/dievus/threader3000)
- [GitTools](https://github.com/internetwache/GitTools)
- [smap](https://github.com/s0md3v/Smap)(nmap with shodan)
- [telegram osint](https://github.com/drego85/tosint)
- [email osint](https://epieos.com/)
- [XSSTRON](https://github.com/RenwaX23/XSSTRON)(Electron JS Browser To Find XSS)

## online
- [xsshunter](https://xsshunter.trufflesecurity.com/app/#/)
- [interactsh-web](https://github.com/projectdiscovery/interactsh-web)(for xss)
- [back-me-up](https://github.com/Dheerajmadhukar/back-me-up)(Sensitive Data Leakage with waybackdata)
- [leakix.net](https://leakix.net/)
- [tor search](./src_for_src/tor_search_en.md)
- [analize pcap file](https://apackets.com/upload)
---
# code scanners
- [SSTImap](https://github.com/vladko312/SSTImap)(code inj scanner)
- [JSFScan](https://github.com/KathanP19/JSFScan.sh)(scanner js)
- [scanner white box](https://github.com/bearer/bearer)
---
# wordlists
- [Bo0oM/fuzz.txt](https://github.com/Bo0oM/fuzz.txt/blob/master/fuzz.txt)
- [enum subds with repl](./src_for_src/subds.md)(wordlist generator)
- [webapp-wordlists](https://github.com/p0dalirius/webapp-wordlists)
- [directory wordlist](https://github.com/ricew4ng/Blasting-Dictionary/blob/master/LFI-Interesting-Files%EF%BC%88249%EF%BC%89.txt)
---
# cheatsheets
- [wifi-penetration-testing-cheatsheet](https://github.com/ivan-sincek/wifi-penetration-testing-cheat-sheet)
- [osint-tools](https://github.com/wddadk/Offensive-OSINT-Tools)
- [pentest-checklist](https://github.com/Hari-prasaanth/Web-App-Pentest-Checklist)
- [awesome ctf](https://github.com/apsdehal/awesome-ctf)
- [enumeration guide](https://github.com/beyondtheoryio/Enumeration-Guide)
- [bash cheatsheet](https://devhints.io/bash)
- [bug](https://github.com/twseptian/oneliner-bugbounty) | [bounty](https://github.com/KingOfBugbounty/KingOfBugBountyTips) | [commands](https://github.com/dwisiswant0/awesome-oneliner-bugbounty)
- [explainshell.com](https://explainshell.com/)
- [AD](https://github.com/dievus/Active-Directory-Exploitation-Cheat-Sheet)
- [xss cheatsheet](https://cheatsheetseries.owasp.org/cheatsheets/XSS_Filter_Evasion_Cheat_Sheet.html)
# other
- [walk](https://github.com/antonmedv/walk)
- [apple blee](https://github.com/hexway/apple_bleee)
- [opendrop](https://github.com/zhovner/opendrop)
- [netcut](https://arcai.com/)
- [macrome](https://github.com/michaelweber/Macrome)(exel hack)
- [PhotoGuard](https://github.com/MadryLab/photoguard)(protect photo from ai)
- [netmap](https://github.com/lmsecure/LMS.NetMap)(анализатор трафика)
- [ddos-attack](https://github.com/karthik558/ddos-attack)
- [reverse shell usiog macros](https://www.offsec.com/offsec/macro-weaponization/)
- [file transfer](https://github.com/LeastAuthority/destiny)
- [bluetooth](https://ru.wikipedia.org/wiki/BlueBorne)[hacking](https://de.wikipedia.org/wiki/Bluesnarfing)[is](https://ru.wikipedia.org/wiki/%D0%91%D0%BB%D1%8E%D0%B4%D0%B6%D0%B5%D0%BA%D0%B8%D0%BD%D0%B3)[fun](https://www.linux-magazin.de/blogs/bluetooth-bias-bluetooth-impersonation-attacks/)[!!!](https://en.wikipedia.org/wiki/Bluebugging)
- [ShellGhost](https://github.com/lem0nSec/ShellGhost)

---