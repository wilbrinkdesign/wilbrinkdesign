### Gracefully offline

```sql
USE master
GO
ALTER DATABASE <database>
SET OFFLINE WITH ROLLBACK IMMEDIATE
GO

USE master
GO
ALTER DATABASE <database>
SET ONLINE
GO
```

### Force offline

```sql
KILL <spid>
```