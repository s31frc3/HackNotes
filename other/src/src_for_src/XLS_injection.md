Если приложение позволяет экспортировать таблицы Excel или принимает XLSX для преобразования в PDF/HTML, оно может пропустить файл через MS Excel для выполнения формул и преобразования.

Увидев подобное приложение на сервере Windows, следует проверить его на SSRF, разместив в содержимом XLSX файла следующую функцию:

=WEBSERVICE("google.com")

⏺ Ряд других полезных нагрузок для тестирования данной уязвимости можно найти по данной ссылке (https://github.com/GainSec/TreeHouse-Wordlists/blob/master/Formula-CSV-XLS-XLSX-Injection/Formula-CSV-XLS-XLSX-Injection-Intruder).