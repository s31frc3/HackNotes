Пример поиска на гитхабе слитых ключей OpenAI API

(path:*.xml OR path:*.json OR path:*.properties OR path:*.sql OR path:*.txt OR path:*.log OR path:*.tmp OR path:*.backup OR path:*.bak OR path:*.enc OR path:*.yml OR path:*.yaml OR path:*.toml OR path:*.ini OR path:*.config OR path:*.conf OR path:*.cfg OR path:*.env OR path:*.envrc OR path:*.prod OR path:*.secret OR path:*.private OR path:*.key) AND (access_key OR secret_key OR access_token OR api_key OR apikey OR api_secret OR apiSecret OR app_secret OR application_key OR app_key OR appkey OR auth_token OR authsecret) AND ("sk-" AND (openai OR gpt))

Гист с подробной инфой

 (https://gist.github.com/win3zz/0a1c70589fcbea64dba4588b93095855)Другие полезные тулзы, которые можно использовать для продвинутого рекона:
1️⃣Online IDE Search: https://redhuntlabs.com/online-ide-search/
2️⃣Keyhacks on GitHub: https://github.com/streaak/keyhacks
3️⃣Google Hacking Database: https://www.exploit-db.com/google-hacking-database


https://github.com/godaddy/tartufo

tartufo — это утилита, которая сканирует репозитории в поисках случайно оставленных токенов и учетных данных. 

Она проверяет всю историю коммитов каждой существующей ветки и ищет секреты, используя регулярки и проверяя энтропию.

Установка:
pip install tartufo

Сканировать удаленный репозиторий:
tartufo scan-remote-repo git@github.com:my_user/my_repo.git

Локальный:
tartufo scan-local-repo /path/to/your/git/repo