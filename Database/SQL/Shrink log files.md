### Shrink log file from a database

```sql
DBCC SHRINKFILE ('<database>_log', 1, TRUNCATEONLY);
```