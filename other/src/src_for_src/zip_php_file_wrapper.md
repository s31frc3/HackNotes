PHP ZIP Wrapper LFI

The zip wrapper processes uploaded .zip files server side allowing a penetration tester to upload a zip file using a vulnerable file upload function and leverage he zip filter via an LFI to execute. A typical attack example would look like:

1. Create a PHP reverse shell

2. Compress to a .zip file

3. Upload the compressed shell payload to the server

4. Use the zip wrapper to extract the payload using: php?page=zip://path/to/file.zip%23shell

5. The above will extract the zip file to shell, if the server does not append .php rename it to shell.php instead

If the file upload function does not allow zip files to be uploaded, attempts can be made to bypass the file upload function (see: OWASP file upload testing document).

```sh
zip payload.zip payload.php;
mv payload.zip shell.jpg;
rm payload.php
```

- https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/File%20Inclusion#wrapper-zip
- https://www.4rth4s.xyz/2020/06/root-me-local-file-inclusion-wrappers.html