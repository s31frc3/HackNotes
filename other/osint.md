[back](/README.md)

## Пассивная расзведка. ASN/CIDR
- [bgp.he.net](https://bgp.he.net/)(online)
- [spk](https://github.com/dhn/spk)(cli)

## DNS/IPS/ASN
- [amass](https://github.com/owasp-amass/amass)
- [findomain](https://github.com/Findomain/Findomain)
- [hakip2host](https://github.com/hakluke/hakip2host) (Cert scrapping + DNS PTR)
- [shuffledns](https://github.com/projectdiscovery/shuffledns)
- [alterx](https://github.com/projectdiscovery/alterx)
- [puredns](https://github.com/d3mondev/puredns) (Получаем список валидных
доменов)
- [dnsx](https://github.com/projectdiscovery/dnsx) (A/CNAME записи валидных
доменов, далее используем nmap)

## Определение сервисов и технологий, версий ПО
- [визуализация nmap выхлопа](https://github.com/SabyasachiRana/WebMap)
- [gowitness](https://github.com/sensepost/gowitness) 

## Source code / configs / git
- [trufflehog](https://github.com/trufflesecurity/trufflehog)
- [dumper](https://github.com/arthaud/git-dumper)
- [Photon](https://github.com/s0md3v/Photon)
- [katana](https://github.com/projectdiscovery/katana)

## Emails / passwords
- [bbot](https://github.com/blacklanternsecurity/bbot)
- [NTLMRecon](https://github.com/pwnfoo/NTLMRecon)
- [Валидация УЗ Exchange](https://swarm.ptsecurity.com/attacking-ms-exchange-web-interfaces/)
- [smtp](https://mailtrap.io/blog/verify-email-address-without-sending/)

# phd 15
## shodan

|**Dork**|**Purpose**|**Example**|
|---|---|---|
|`ssl:"Company Name"`|Find Domains & IPs Owned By The Company|`ssl:"Facebook Inc."`|
|`ssl.cert.subject.cn:"domain.com"`|Find Subdomain & IPs for Domain/Subdomain|`ssl.cert.subject.cn:"corp.amazon.com"`|
|`http.title:"Page Title"`|Find All IPs that include the same title|`http.title:"Web Transfer Client"`|
|`http.favicon.hash:-1234567890`|Find IPs/Domains that include the same Favicon|`http.favicon.hash:-2107233094`|
|`X-XXX-X 200/301/302/403`|Specific http Header Search (e.g., status code 200)|`X-ORACLE-DMS-ECID 200`|
|`net:127.0.0.1:22`|CIDR Search|`net:64.4.248.0/22 (Paypal CIDR)`|
|`product:"product name"`|Specific Product Search|`product:"IIS" 403`|
|`-DORK`|Remove specific results from search|`ssl:"Facebook Inc." -http.title:"Bad Request"`|
shodan.io/host/ip shows all connected vhosts

## virustotal

| **Link**                                                                          | **Example**                                                                                            | **Purpose**                                                          |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| `https://www.virustotal.com/vtapi/v2/domain/report?apikey=xxxxxx&domain=app.com`  | `https://www.virustotal.com/vtapi/v2/domain/report?apikey=YourAPI&domain=am-fmmobileapp.att.com`       | Find Subdomain & IPs / Endpoints including internal ones / HashFiles |
| `https://www.virustotal.com/vtapi/v2/ip-address/report?apikey=xxxxxx&ip=TargetIP` | `https://www.virustotal.com/vtapi/v2/ip-address/report?apikey=YourAPI&ip=144.160.125.212 (AT&T IP)`    | Find Subdomains & Domains & VHosts & Endpoints                       |
| `https://www.virustotal.com/gui/file/sha256`                                      | `https://www.virustotal.com/gui/file/5b13bf5957b84ef7bb9d0b6cd509c947ff6a37d67efdac2b986ddd3b908aad10` | Via Hash sha256 Search for File Name / Endpoint / Download The File  |

VirusTotal — Top Keywords Tips for Endpoints Search

|**Backup Files**|**Auth Bypass**|**File Extensions**|
|---|---|---|
|`.zip` / `.7z`|`Token=`|`.aspx` `.asp` `.asmx` `.ashx`|
|`.gz` / `.tar`|`apikey=`|`.php` `.php3`|
|`.dll` / `.exe`|`/resetpassword/`|`.html` `.xhtml`|
|`.msi` / `.iso`|`/registration`|`.xml` `.txt`|
||`eyJ` (JWT Token)|`.jsf` `.jsp` `.cgi`|
||`==` (encoded creds)||
||`@`||
||`.env`||
||`config`||
||`/.git/`||

https://github.com/orwagodfather/virustotalx

## 0zay dorking
urlscan.io dorking ( * =anything) (- = remove from results)
`bmw.* -bmw.com -bmw.de -sedo.com -sbomo.com -cahracreristics.info`
`bmw-*`
## google dorking
`sile:bmw>* | site:bmw>*>* | site:bmw>*>*>*>*`
## favicon recon
1. visit en.fofa.info
2. enter bmw.com
3. select the icons
4. copy the hashes
5. search for hash over shodan (http.favicon.hash:000000000)

`cat bmw | httpx -path /favicon.ico -mc 200`

favicon-hash.kmsec.uk

censys
services.http.response.faviocns.md5_hash:xxxxxxxxxxxxxx

zoomeye.ai
iconhash="xxxxxx"

## [Sourcegraph Search](https://sourcegraph.com/search):

| **KeyWords/Query**   | **Why It's Used**                                | **Example**                                           |
| -------------------- | ------------------------------------------------ | ----------------------------------------------------- |
| `lang:language`      | Filter results by programming languages          | `pydays.com lang:python`                              |
| `patternType:regexp` | Enables regex searches for complex vuln patterns | `att.com lang:java patternType:regexp (\s*".*+\..*")` |
| `repo:Repo Name`     | Search for specific repositories                 | `repo:^github\.com/paypal/.*`                         |
| `file:file path`     | Limits searches to specific files                | `att.com password file:\.env`                         |
| `content:`           | Matches exact code snippets                      | `content:"new Function("`                             |
| `AND`                | Search for the same keywords in one code         | `att.com AND password AND admin`                      |
| `OR`                 | Search from more than 1 keyword in code          | `att.com AND (password OR passwd OR pw)`              |
| `NOT`                | Remove a specific keyword from results           | `att.com password NOT help.att NOT test`              |
