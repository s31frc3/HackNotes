JIRA - это коммерческая система отслеживания проблем, разработанная Atlassian, которая позволяет отслеживать ошибки и гибко управлять проектами. На днях на гитхабе появился новый сканер уязвимостей написанный на Python для JIRA, под названием Jira-Lens (https://github.com/MayankPandey01/Jira-Lens).

Этот инструмент выполняет более 25 проверок, включая CVE и угрозы раскрытия информации в предоставленном экземпляре JIRA.

Чтобы немного автоматизировать, можно с помощью Nuclei определить какие хосты относятся к JIRA и просканировать их все:

cat alive.domains | nuclei -c 50 -silent -t ~/nuclei-templates/exposed-panels/jira-detect.yaml | awk '{print $6}' | anew jira.domains && python3 Jira-Lens.py -f jira.domains

[Ссылка на GitHub](https://github.com/MayankPandey01/Jira-Lens)