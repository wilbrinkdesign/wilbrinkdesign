### Reset the ID column from a table

```sql
DBCC CHECKIDENT('<table>', RESEED, 1)
```