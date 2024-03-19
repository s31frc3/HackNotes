Короч. Встречали firebase на страницах? Обычно это подключение js-ника и конфиг вида
```js
firebase.initializeApp({
  apiKey: "VHkgcGlkb3IpMDAwKSkpKSkpKSk=",
  authDomain: "blablabla"
  ...
});
```
Иногда это используется для заявок, фидбэков и вот этого всего. И если его неправильно готовят, то на нем можно зарегистрироваться через signupNewUser (тыц (https://stackoverflow.com/questions/37322747/using-mail-and-password-to-authenticate-via-the-rest-api-firebase)) и получить доступ к данным, которые собирали сотрудники (в моем случае это было через Firestore).

Только как имя базы узнать я не знаю, в моем случае оно тоже светилось в файлах фронта, но может в комментах подскажут.

Еще надо попробовать pyfireconnect (https://github.com/quintuslabs/pyfireconnect) и python-firebase (https://github.com/ozgur/python-firebase)

Slavik (https://hackerone.com/savik?type=user) поресерчил эту тему и сделал скрипт (https://github.com/savushkin-yauheni/savik-pentest-utils/blob/main/examples/firebase_api_key_checker.py), который проверяет что доступно по данным Firebase.
Если есть api_key и project_id, то уже можно тыкаться по Realtime Database, Firestore, Storage.