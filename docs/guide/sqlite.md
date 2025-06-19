# SQLite Databases

The Renoise API allows you to create or load [SQLite databases](https://sqlite.org). This can be used to either efficiently deal with large data blobs within your tools or to read existing database files from other applications.

See [Renoise SQLite API](../API/renoise/renoise.SQLite.md) for more info.

A quick example on how to open and read from an existing database file:

```lua
-- create a new database (rwc = read/write/create)
local db, status, error = renoise.SQLite.open("./some_test.db", "rwc")
-- NB: use renoise.SQLite.open() to create a in-memory db instead
print("Create:", db.is_open, db.error_code, db.error_message)

local sql = [[
  CREATE TABLE numbers(num1,num2,str);
  INSERT INTO numbers VALUES(1,11,"ABC");
  INSERT INTO numbers VALUES(2,22,"DEF");
  INSERT INTO numbers VALUES(3,33,"UVW");
  INSERT INTO numbers VALUES(4,44,"XYZ");
]]

print("Exec:", db:execute(sql))
print("Changes:", db.changes, db.total_changes, db.error_message)

-- read from an existing db using a prepared statement
local db, status, error = renoise.SQLite.open("./test.db", "ro") -- read-only
print("Open:", db.is_open, db.error_code, db.error_message)

local stm = db:prepare("SELECT * from numbers")
print("Read:", stm.columns, stm.unames)

for k in stm:rows() do
 rprint(k) 
end
```