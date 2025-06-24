# renoise.SQLite<a name="renoise.SQLite"></a>  

<!-- toc -->
  
## Constants
### Status<a name="Status"></a>
> ```lua
> {
>     OK: integer = 0,
>     ERROR: integer = 1,
>     INTERNAL: integer = 2,
>     PERM: integer = 3,
>     ABORT: integer = 4,
>     BUSY: integer = 5,
>     LOCKED: integer = 6,
>     NOMEM: integer = 7,
>     READONLY: integer = 8,
>     INTERRUPT: integer = 9,
>     IOERR: integer = 10,
>     CORRUPT: integer = 11,
>     NOTFOUND: integer = 12,
>     FULL: integer = 13,
>     CANTOPEN: integer = 14,
>     MISMATCH: integer = 20,
>     MISUSE: integer = 21,
>     NOLFS: integer = 22,
>     FORMAT: integer = 24,
>     RANGE: integer = 25,
>     NOTADB: integer = 26,
>     ROW: integer = 100,
>     DONE: integer = 101,
> }
> ```
  

---  
## Functions
### open(filename : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), flags : [`SQLiteOpenFlags`](#SQLiteOpenFlags) | [`SQLiteOpenModes`](#SQLiteOpenModes)[`?`](../../API/builtins/nil.md))<a name="open"></a>
`->`[`SQLiteDatabase`](#sqlitedatabase)[`?`](../../API/builtins/nil.md), [`renoise.SQLite.Status`](renoise.SQLite.md#Status)[`?`](../../API/builtins/nil.md), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Opens (or creates if it does not exist) a SQLite database either in memory
> or from the given file path.
> 
> ### Examples:
> 
> ```lua
> -- open an existing db in read-only mode.
> local db, status, error = renoise.SQLite.open('MyDatabase.sqlite', 'ro')
> if db then
>   -- do some database calls...
>   db:close()
> else
>   -- handle error
> end
> 
> -- open an in-memory db in read-write-create mode.
> local db, status, error = renoise.SQLite.open()
> if db then
>   -- do some database calls...
>   db:close()
> else
>   -- handle error
> end
> ```
> 
> 
> ```lua
> -- Configure database open mode.
> -- Default: "rwc" (read-write-create).
> -- Raw open mode flags from SQLite.
> -- See https://sqlite.org/c3ref/open.html#urifilenamesinsqlite3open
> flags:
>     | "ro"
>     | "rw"
>     | "rwc"
> ```  



---  
## Structs  
# SQLiteDatabase<a name="SQLiteDatabase"></a>  

---  
## Properties
### is_open : [`boolean`](../../API/builtins/boolean.md)<a name="is_open"></a>
> **READ-ONLY** Whether or not the database is open.

### is_closed : [`boolean`](../../API/builtins/boolean.md)<a name="is_closed"></a>
> **READ-ONLY** Whether or not the database is closed.

### error_code : [`renoise.SQLite.Status`](renoise.SQLite.md#Status)<a name="error_code"></a>
> **READ-ONLY** The most recent error code.

### error_message : [`string`](../../API/builtins/string.md)<a name="error_message"></a>
> **READ-ONLY** The most recent error message.

### changes : [`integer`](../../API/builtins/integer.md)<a name="changes"></a>
> **READ-ONLY** Number of database rows that were changed, inserted, or deleted by
> the most recent SQL statement.
> Only changes that are directly specified by INSERT, UPDATE, or DELETE statements
> are counted.
> Auxiliary changes caused by triggers are not counted. Use `db.total_changes`
> to find the total number of changes.

### total_changes : [`integer`](../../API/builtins/integer.md)<a name="total_changes"></a>
> **READ-ONLY** The number of database rows that have been modified by INSERT,
> UPDATE or DELETE statements since the database was opened.
> This includes UPDATE, INSERT and DELETE statements executed as part of
> trigger programs. All changes are counted as soon as the statement that
> produces them is completed by calling either `stmt:reset()` or `stmt:finalize()`.

### last_insert_rowid : [`integer`](../../API/builtins/integer.md)<a name="last_insert_rowid"></a>
> **READ-ONLY** Gets the rowid of the most recent INSERT into the database.
> If no inserts have ever occurred, 0 is returned.
> (Each row in an SQLite table has a unique 64-bit signed integer
> key called the 'rowid'. This id is always available as an undeclared
> column named ROWID, OID, or _ROWID_.
> If the table has a column of type INTEGER PRIMARY KEY then that column
> is another alias for the rowid.)
> 
> If an INSERT occurs within a trigger, then the rowid of the inserted
> row is returned as long as the trigger is running. Once the trigger terminates,
> the value returned reverts to the last value inserted before the trigger fired.

  

---  
## Functions
### close([*self*](../../API/builtins/self.md))<a name="close"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

>  Closes a database. All SQL statements prepared using `db:prepare()` should
> have been finalized before this function is called.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a error code.
### prepare([*self*](../../API/builtins/self.md), sql : [`string`](../../API/builtins/string.md))<a name="prepare"></a>
`->`[`SQLiteStatement`](#sqlitestatement)[`?`](../../API/builtins/nil.md), [`renoise.SQLite.Status`](renoise.SQLite.md#Status), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Compiles the SQL statement in string sql into an internal representation
> and returns this as userdata. The returned object should be used for all
> further method calls in connection with this specific SQL statement.
> 
> The function returns the statement object and `renoise.SQLlite.Status.OK`
> on success or else nil, an error code and the error message.
> 
> ### Examples:
> 
> ```lua
> local statement, code, error = db:prepare("SELECT * from my_table")
> if statement then
>   -- bind, step or do some queries
> else
>   -- handle error
> end
> ```
> See: `SQLiteStatement`
### finalize([*self*](../../API/builtins/self.md), temp_only : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="finalize"></a>
>  Finalizes all statements that have not been explicitly finalized.
### execute([*self*](../../API/builtins/self.md), sql : [`string`](../../API/builtins/string.md), fun : fun(data: any, cols: integer, values: table<SQLiteValue>, names: table<string>)?, data : [`any`](../../API/builtins/any.md))<a name="execute"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status), [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

> Compiles and executes the SQL statement(s) given in string sql.
> The statements are simply executed one after the other and not stored.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else an
> error code and the error message.
> 
> If one or more of the SQL statements are queries, then the callback
> function specified in `fun` is invoked once for each row of the query
> result (if `fun` is `nil`, no callback is invoked).
> 
> The callback receives four arguments:
> `data` (the third parameter of the `db:exec()` call),
> the number of columns in the row, a table with the column values
> and another table with the column names.
> 
> The callback function should return `0`. If the callback returns
> a non-zero value then the query is aborted, all subsequent SQL statements
> are skipped and `db:exec()` returns `sqlite.ABORT`.
> 
> ### Example:
> 
> ```lua
> sql = [[
>   CREATE TABLE numbers(num1,num2,str);
>   INSERT INTO numbers VALUES(1,11,"ABC");
>   INSERT INTO numbers VALUES(2,22,"DEF");
>   INSERT INTO numbers VALUES(3,33,"UVW");
>   INSERT INTO numbers VALUES(4,44,"XYZ");
>   SELECT * FROM numbers;
> ]]
> function show_row(udata,cols,values,names)
>   assert(udata=='test_udata')
>   print('exec:')
>   for i=1,cols do print('',names[i],values[i]) end
>   return 0
> end
> db:execute(sql,show_row,'test_udata')
> ```
### interrupt([*self*](../../API/builtins/self.md))<a name="interrupt"></a>
>  Causes any pending database operation to abort and return at the next opportunity.
### busy_handler([*self*](../../API/builtins/self.md), fun : (udata : [`any`](../../API/builtins/any.md), retries : [`integer`](../../API/builtins/integer.md)) `->` [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md), data : [`any`](../../API/builtins/any.md))<a name="busy_handler"></a>
> Sets or removes a busy handler for a SQLiteDatabase.
> `fun` is either a Lua function that implements the busy handler or `nil`
> to remove a previously set handler. This function returns nothing.
> The handler function is called with two parameters: `data` and the number
> of (re-)tries for a pending transaction.
> It should return `nil`, `false` or `0` if the transaction is to be aborted.
> All other values will result in another attempt to perform the transaction.
> 
> (See the SQLite documentation for important hints about writing busy handlers.)
### busy_timeout([*self*](../../API/builtins/self.md), t : [`integer`](../../API/builtins/integer.md))<a name="busy_timeout"></a>
> Sets a busy handler that waits for `t` milliseconds if a transaction cannot
> proceed. Calling this function will remove any busy handler set by `db:busy_handler()`;
> calling it with an argument less than or equal to 0 will turn off all busy handlers.
### nrows([*self*](../../API/builtins/self.md), sql : [`string`](../../API/builtins/string.md))<a name="nrows"></a>
`->`() `->` table<[`string`](../../API/builtins/string.md), [`SQLiteValue`](#SQLiteValue)>[`?`](../../API/builtins/nil.md)  

> Creates an iterator that returns the successive rows selected
> by the SQL statement given in string sql.
> 
> Each call to the iterator returns a table in which the named fields correspond
> to the columns in the database.
### rows([*self*](../../API/builtins/self.md), sql : [`string`](../../API/builtins/string.md))<a name="rows"></a>
`->`() `->` [`any`](../../API/builtins/any.md)[]  

> Creates an iterator that returns the successive rows selected by the SQL
> statement given in string `sql`. Each call to the iterator returns a table
> in which the numerical indices 1 to n correspond to the selected columns
> 1 to n in the database.
> 
> ### Example:
> 
> ```lua
> for a in db:rows('SELECT * FROM table') do
>   for _,v in ipairs(a) do print(v) end
> end
> ```
### urows([*self*](../../API/builtins/self.md), sql : [`string`](../../API/builtins/string.md))<a name="urows"></a>
`->`() `->` [`SQLiteValue`](#SQLiteValue)[`?`](../../API/builtins/nil.md)  

> Creates an iterator that returns the successive rows selected by the SQL
> statement given in string sql. Each call to the iterator returns the values
> that correspond to the columns in the currently selected row.
> 
> ### Example:
> 
> ```lua
> for num1,num2 in db:urows('SELECT * FROM table') do
>   print(num1,num2)
> end
> ```  



---  
## Aliases  
### SQLiteValue<a name="SQLiteValue"></a>
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
  
  

  
# SQLiteStatement<a name="SQLiteStatement"></a>  
> Precompiled SQLite statements, as created with `db:prepare()`.  

---  
## Properties
### is_open : [`boolean`](../../API/builtins/boolean.md)<a name="is_open"></a>
> **READ-ONLY** Whether or not the statement hasn't been finalized.

### is_closed : [`boolean`](../../API/builtins/boolean.md)<a name="is_closed"></a>
> **READ-ONLY** Whether or not the statement has been finalized.

### columns : [`integer`](../../API/builtins/integer.md)<a name="columns"></a>
> **READ-ONLY** Number of columns in the result set returned by the statement,
> or 0 if the statement does not return data (for example an UPDATE).

### last_insert_rowid : [`integer`](../../API/builtins/integer.md)<a name="last_insert_rowid"></a>
> **READ-ONLY** rowid of the most recent INSERT into the database corresponding
> to this statement.

### named_types : table<[`string`](../../API/builtins/string.md), [`string`](../../API/builtins/string.md)><a name="named_types"></a>
> **READ-ONLY** A table with the names and types of all columns in the current
> result set of the statement.

### named_values : table<[`string`](../../API/builtins/string.md), [`SQLiteValue`](#SQLiteValue)><a name="named_values"></a>
> **READ-ONLY** A table with names and values of all columns in the current
> result row of a query.

### names : [`string`](../../API/builtins/string.md)[]<a name="names"></a>
> **READ-ONLY** A list of the names of all columns in the result set returned
> by the statement.

### values : [`SQLiteValue`](#SQLiteValue)[]<a name="values"></a>
> **READ-ONLY** A list of the values of all columns in the result set
> returned by the statement.

### types : [`string`](../../API/builtins/string.md)[]<a name="types"></a>
> **READ-ONLY** A list of the types of all columns in the result set returned
> by the statement.

### unames : [`string`](../../API/builtins/string.md)[]<a name="unames"></a>
> **READ-ONLY** A list of the names of all columns in the result set returned
> by the statement.

### utypes : [`string`](../../API/builtins/string.md)[]<a name="utypes"></a>
> **READ-ONLY** A list of the types of all columns in the result set returned
> by the statement.

### uvalues : [`SQLiteValue`](#SQLiteValue)[]<a name="uvalues"></a>
> **READ-ONLY** A list of the values of all columns in the current result
> row of a query.

  

---  
## Functions
### name([*self*](../../API/builtins/self.md), n : [`integer`](../../API/builtins/integer.md))<a name="name"></a>
`->`[`string`](../../API/builtins/string.md)  

> The name of column `n` in the result set of the statement.
> (The left-most column is number 0.)
### value([*self*](../../API/builtins/self.md), n : [`integer`](../../API/builtins/integer.md))<a name="value"></a>
`->`[`SQLiteValue`](#SQLiteValue)  

> The value of column `n` in the result set of the statement.
> (The left-most column is number 0.)
### type([*self*](../../API/builtins/self.md), n : [`integer`](../../API/builtins/integer.md))<a name="type"></a>
`->`[`string`](../../API/builtins/string.md)  

> The type of column `n` in the result set of the statement.
> (The left-most column is number 0.)
### finalize([*self*](../../API/builtins/self.md))<a name="finalize"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Frees a prepared statement.
> 
> If the statement was executed successfully, or not executed at all,
> then `renoise.SQLlite.Status.OK` is returned. If execution of the statement
> failed then an error code is returned.
### reset([*self*](../../API/builtins/self.md))<a name="reset"></a>
> Resets the statement so that it is ready to be re-executed.
> Any statement variables that had values bound to them using
> the `stmt:bind*()` functions retain their values.
### step([*self*](../../API/builtins/self.md))<a name="step"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Evaluates the (next iteration of the) prepared statement.
> It will return one of the following values:
>  - `renoise.SQLite.Status.BUSY`: the engine was unable to acquire the locks needed.
>    If the statement is a COMMIT or occurs outside of an explicit transaction,
>    then you can retry the statement. If the statement is not a COMMIT and
>    occurs within a explicit transaction then you should rollback the transaction
>    before continuing.
>  - `renoise.SQLite.Status.DONE`: the statement has finished executing successfully.
>    `stmt:step()` should not be called again on this statement without first
>    calling `stmt:reset()` to reset the virtual machine back to the initial state.
>  - `renoise.SQLite.Status.ROW`: this is returned each time a new row of data is ready.
>    The values may be accessed using the column access functions.
>    `stmt:step()` can be called again to retrieve the next row of data.
>  - `renoise.SQLite.Status.ERROR`: a run-time error (e.g. a constraint violation) occurred.
>    `stmt:step()` should not be called again. More information may be found by
>    calling `db:error_message()`. A more specific error code can be obtained by calling
>    `stmt:reset()`.
>  - `renoise.SQLite.Status.MISUSE`: the function was called inappropriately.
>    Perhaps because the statement has already been finalized or a previous call to
>    `stmt:step()` has returned `sqlite.ERROR` or `sqlite.DONE`.
### bind_parameter_count([*self*](../../API/builtins/self.md))<a name="bind_parameter_count"></a>
`->`[`integer`](../../API/builtins/integer.md)  

> Gets the largest statement parameter index in prepared statement stmt.
> When the statement parameters are of the forms ":AAA" or "?", then they
> are assigned sequentially increasing numbers beginning with one, so the
> value returned is the number of parameters.
> However if the same statement parameter name is used multiple times,
> each occurrence is given the same number, so the value returned is the
> number of unique statement parameter names.
> 
> If statement parameters of the form "?NNN" are used (where NNN is an
> integer) then there might be gaps in the numbering and the value returned
> by this interface is the index of the statement parameter with the largest
> index value.
### bind_parameter_name([*self*](../../API/builtins/self.md), n : [`any`](../../API/builtins/any.md))<a name="bind_parameter_name"></a>
`->`[`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), [`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Gets the name of the `n`-th parameter in prepared statement stmt.
> Statement parameters of the form ":AAA" or "@AAA" or "$VVV" have
> a name which is the string ":AAA" or "@AAA" or "$VVV".
> In other words, the initial ":" or "$" or "@" is included as part of the name.
> Parameters of the form "?" or "?NNN" have no name.
> The first bound parameter has an index of 1. If the value `n` is out of
> range or if the `n`-th parameter is nameless, then nil is returned.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a numerical error code.
> See: `renoise.SQLite.Status`
### bind([*self*](../../API/builtins/self.md), n : [`integer`](../../API/builtins/integer.md), value : [`boolean`](../../API/builtins/boolean.md) | [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md))<a name="bind"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Binds `value` to statement parameter `n`. If `value` is a string, it is
> bound as text, otherwise if it is a number it is bound as a double.
> If it is a boolean, it is bound as 0 or 1.
> If `value` is nil, any previous binding is removed.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a error code.
### bind_blob([*self*](../../API/builtins/self.md), n : [`integer`](../../API/builtins/integer.md), blob : [`string`](../../API/builtins/string.md))<a name="bind_blob"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Binds string `blob` (which can be a binary string) as a blob to
> statement parameter `n`.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a error code.
### bind_names([*self*](../../API/builtins/self.md), nametable : table<string|integer, boolean|string|number>)<a name="bind_names"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Binds the values in `nametable` to statement parameters.
> 
> If the statement parameters are named (i.e., of the form ":AAA" or "$AAA")
> then this function looks for appropriately named fields in nametable;
> if the statement parameters are not named, it looks for numerical fields 1
> to the number of statement parameters.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a error code.
### bind_values([*self*](../../API/builtins/self.md), ...[`boolean`](../../API/builtins/boolean.md) | [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md))<a name="bind_values"></a>
`->`[`renoise.SQLite.Status`](renoise.SQLite.md#Status)  

> Binds the given values to statement parameters.
> 
> The function returns `renoise.SQLlite.Status.OK` on success or else a error code.
> See: `renoise.SQLite.Status`
### nrows([*self*](../../API/builtins/self.md))<a name="nrows"></a>
`->`() `->` table<[`string`](../../API/builtins/string.md), [`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)>[`?`](../../API/builtins/nil.md)  

> Creates an iterator over the names and values of the result
> set of the statement. Each iteration returns a table with the names
> and values for the current row.
> 
> This is the prepared statement equivalent of `db:nrows()`.
> See: `SQLiteDatabase.nrows`
### rows([*self*](../../API/builtins/self.md))<a name="rows"></a>
`->`() `->` [`any`](../../API/builtins/any.md)[]  

> Creates an iterator over the values of the result set of the statement.
> Each iteration returns an array with the values for the current row.
> This is the prepared statement equivalent of `db:rows()`.
> See: `SQLiteDatabase.rows`
### urows([*self*](../../API/builtins/self.md))<a name="urows"></a>
`->`() `->` [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)  

> Creates an iterator over the values of the result set of the statement.
> Each iteration returns the values for the current row.
> This is the prepared statement equivalent of `db:urows()`.
> See: `SQLiteDatabase.urows`  



---  
## Aliases  
### SQLiteValue<a name="SQLiteValue"></a>
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
  
  

  



---  
## Aliases  
### SQLiteOpenFlags<a name="SQLiteOpenFlags"></a>
[`integer`](../../API/builtins/integer.md)  
> Raw open mode flags from SQLite.
> See https://sqlite.org/c3ref/open.html#urifilenamesinsqlite3open  
  
### SQLiteOpenModes<a name="SQLiteOpenModes"></a>
`"ro"` | `"rw"` | `"rwc"`  
> ```lua
> -- Configure database open mode.
> -- Default: "rwc" (read-write-create).
> SQLiteOpenModes:
>     | "ro"
>     | "rw"
>     | "rwc"
> ```  
  
### SQLiteValue<a name="SQLiteValue"></a>
[`string`](../../API/builtins/string.md) | [`integer`](../../API/builtins/integer.md)  
  
  

