### Delete records from a specific date

```sql
DELETE FROM <table> WHERE <column> < DATEADD(month, -6, GETDATE())
```