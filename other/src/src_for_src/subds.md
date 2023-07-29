Чтобы найти еще больше поддоменов для атаки, мы можем сгенеририровать комбинации или перестановки уже известных нам поддоменов.
 
В этом методе нам также нужен небольшой список слов, который содержал бы такие распространенные слова, как mail,  internal,  dev,  demo,  accounts,  ftp,  admin (похоже на брутфорс поддоменов, но требуется меньше слов). Список таких слов можно найти например здесь (https://gist.githubusercontent.com/six2dez/ffc2b14d283e8f8eff6ac83e20a3c4b4/raw).

Например, давайте рассмотрим поддомен dev.example.com. Мы можем сгенерировать различные вариации перестановок этого поддомена (смотри скрин ниже) с помощью инструмента gotator (https://github.com/Josue87/gotator):

gotator -sub domains.txt -perm permutations_list.txt -depth 3 -numbers 10 | uniq > permutations.txt

Теперь, когда мы составили огромный список всех возможных поддоменов, пришло время зарезолвить их и узнать, существуют ли они на самом деле. Для этого мы будем использовать puredns (https://github.com/d3mondev/puredns):

puredns resolve permutations.txt -r resolvers.txt