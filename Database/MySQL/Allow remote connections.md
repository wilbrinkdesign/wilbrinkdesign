### Allow remote connections

```mysql
GRANT ALL PRIVILEGES ON *.* TO '<user>'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```