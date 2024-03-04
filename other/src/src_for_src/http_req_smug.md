if 400 Bad Request:
```
GET / H HTTP/1.1
Host: asdf.com
```
if 505 HTTP Version Not Supported:
```
GET / HTTP/13.37
X: x HTTP/1.1
Host: asdf.com
```
if 400 Bad Request:
```
GET / HTTP/1.1
Host: x HTTP/1.1
Host: asdf.com
```