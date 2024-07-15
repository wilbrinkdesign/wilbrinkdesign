### Replace whole text in column

```sql
update <table> set <column1> = <column2> where <column1> like '%<text>%'
```

### Replace specific text in column

```sql
update <table> set <column1> = REPLACE(<column1>,'<text1>','<text2>') where <column1> like '%<text1>%'
```