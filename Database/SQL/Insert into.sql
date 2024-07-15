SET IDENTITY_INSERT <table_test> ON
INSERT INTO <table_test> (<column1>, <column2>)
SELECT * FROM <table_prod>
SET IDENTITY_INSERT <table_test> OFF