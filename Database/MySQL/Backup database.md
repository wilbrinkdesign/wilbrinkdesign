### Backup database

```mysql
pushd "C:\Program Files\MySQL\MySQL Server 5.1\bin"
mysql.exe -u<user> -p<password> -s -N -e "SHOW DATABASES" | for /F "usebackq" %%D in (`findstr /V "information_schema performance_schema mysql sys"`) do mysqldump %%D -u<user> -p<password> > \\<server>\<folder>\%%D.sql
```