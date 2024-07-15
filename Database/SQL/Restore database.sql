DECLARE @BACKUP_LOCATIE VARCHAR(MAX)
DECLARE @DBFILES_LOCATIE VARCHAR(MAX)
DECLARE @DBPROD VARCHAR(MAX)
DECLARE @DBTEST VARCHAR(MAX)
DECLARE @EXECUTE_USE AS VARCHAR(MAX)
DECLARE @EXECUTE_BACKUP AS VARCHAR(MAX)
DECLARE @EXECUTE_RESTORE AS VARCHAR(MAX)
DECLARE @EXECUTE_RENAME_DATA AS VARCHAR(MAX)
DECLARE @EXECUTE_RENAME_LOG AS VARCHAR(MAX)

SET @BACKUP_LOCATIE = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\Backup\'
SET @DBFILES_LOCATIE = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\'
SET @DBPROD = '<database_prod>'
SET @DBTEST = '<database_test>'
SET @EXECUTE_USE = 'USE '+@DBPROD+''
SET @EXECUTE_BACKUP = 'BACKUP DATABASE '+@DBPROD+' TO DISK = '''+@BACKUP_LOCATIE+''+@DBPROD+'.bak'' WITH INIT'
SET @EXECUTE_RESTORE = 'RESTORE DATABASE '+@DBTEST+' FROM DISK = '''+@BACKUP_LOCATIE+''+@DBPROD+'.bak'' WITH REPLACE, RECOVERY, MOVE '''+@DBPROD+''' TO '''+@DBFILES_LOCATIE+''+@DBTEST+'.mdf'', MOVE '''+@DBPROD+'_log'' TO '''+@DBFILES_LOCATIE+''+@DBTEST+'_log.ldf'''
SET @EXECUTE_RENAME_DATA = 'ALTER DATABASE '+@DBTEST+' MODIFY FILE (NAME=N'''+@DBPROD+''', NEWNAME=N'''+@DBTEST+''')'
SET @EXECUTE_RENAME_LOG = 'ALTER DATABASE '+@DBTEST+' MODIFY FILE (NAME=N'''+@DBPROD+'_log'', NEWNAME=N'''+@DBTEST+'_log'')'

EXEC(@EXECUTE_USE);
EXEC(@EXECUTE_BACKUP);
EXEC(@EXECUTE_RESTORE);
EXEC(@EXECUTE_RENAME_DATA);
EXEC(@EXECUTE_RENAME_LOG);