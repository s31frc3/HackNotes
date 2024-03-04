Git утечки

Раз уж на то пошло, соберу здесь все инструменты, которыми пользуюсь для поиска утечек и других полезных вещей в гит репозиториях.

GitDorker (https://github.com/obheda12/GitDorker) - использует список дорков гита для поиска утечек, токенов, ключей и тп по ключевому слову.
python3 GitDorker.py -tf TOKENSFILE -q tesla.com -d Dorks/DORKFILE -o tesla

github-dorks (https://github.com/techgaun/github-dorks) - тоже самое, только тут поиск происходит по репозиторию а не по ключевому слову.
github-dork.py -r techgaun/github-dorks

git-dumper (https://github.com/arthaud/git-dumper) - если вы нашли на тестируемом сайте .git папку, с помощью этого вы можете сдампить все файлы, которые принадлежат этой папке.
./git_dumper.py http://website.com/.git ~/website

trufflehog (https://github.com/trufflesecurity/trufflehog) - об этом все знают, но не включит не мог. Поиск секретов по репозиториям git или github.
trufflehog git https://github.com/trufflesecurity/trufflehog.git
trufflehog github --repo=https://github.com/trufflesecurity/test_keys

Важно добавить, что у гитхаба есть рейт-лимит, который ограничивает скорость до 30 запросов в минуту. Потому для полного сканирования потребуется некоторое время.
