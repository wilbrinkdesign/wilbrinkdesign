### Copy files, mirror and exclude specific dirs/files

```cmd
robocopy <source> <target> /E /R:0 /MIR /A-:SH /XD "<dir1>" "<dir2>" "`$RECYCLE.BIN" /XF "<file1>"
```
