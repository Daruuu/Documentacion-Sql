In this chapter, we’ll learn about some pretty useful concepts in PL/SQL:

1.  What a cursor is
2. The two types of cursors
3. Inserting, updating, and deleting data in tables using PL/SQL
4. Selecting data from a table into PL/SQL
5. What an array is and how to use one


## 1.  What a cursor is

A cursor is an area in memory thta Oracle creates when an SQL statement is run.
The cursor contains several puieces of information including the rows thta th statement has returned(is is a SELECT statement), and atributes about the result set such as the number of rows impacted by the statement.

There are two types of cursors in ORACLE SQL:
- implicit cursors
- explicit cursors

## Implicit Cursors

 is a type of cursor automatically created by Oracle when an SQL statement is run. 
 It’s called an implicit cursor because it’s created automatically – you don’t need to do anything for it to get created.

Whenever your run a DML statement (INSERT, UPDATE, DELETE, or SELECT), an implicit cursor is created:

-   For INSERT statements, the cursor contains the data that is being inserted.
-   For UPDATE or DELETE statements, the cursor identifies the rows that will be affected
-   For SELECT statements, the rows that are retrieved can be stored in an object.

### Using a Cursor with INSERT

First, we’ll need to create a table:

``` sql
CREATE TABLE person (
fname VARCHAR2(50)
);
```

If you run this in an SQL window, the table will be created.

Now let’s write some PL/SQL to insert data into this table.

```sql
BEGIN
  INSERT INTO person (fname)
  VALUES ('John');
  DBMS_OUTPUT.PUT_LINE('Total number of rows impacted: ' || sql%rowcount);
END;
```

The `sql` is the object name of the **SQL** statement that ran last.
The `rowcount` is the attribute of this most recent SQL statement, and 
contains the number of rows impacted by the statement.
The `%`  sign indicates that the rowcount is an attribute of the sql object. So, 
sql%rowcount will **contain the number of rows impacted** by the most recent SQL statement.

```sql
1 row(s) inserted.
Total number of rows impacted: 1
```

The output shows the number of impacted rows. We can do more with this value, such as storing it in a variable:

```sql
DECLARE
  l_total_rows NUMBER(10);
BEGIN
  INSERT INTO person (fname)
  VALUES ('John');
  l_total_rows := sql%rowcount;
  DBMS_OUTPUT.PUT_LINE('Total number of rows impacted: ' || l_total_rows);
END;
```

You can also use this information in an IF statement and run different code based on the value.

```sql
DECLARE
  l_total_rows NUMBER(10);
BEGIN
  INSERT INTO person (fname)
  VALUES ('John');
  l_total_rows := sql%rowcount;
  IF (l_total_rows > 0) THEN
    DBMS_OUTPUT.PUT_LINE('Rows inserted: ' || l_total_rows);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No rows inserted.');
  END IF;
END;
```

If you run a SELECT statement on your table, you should see the data in the table. Assuming the statement was only run once, this is what you’ll see:

**FNAME**
John


### Example – Using a Cursor with UPDATE

We can make use of implicit cursors in PL/SQL with UPDATE statements. For example, this code shows us the **number of rows impacted by the UPDATE** statement.

```sql
BEGIN
  UPDATE person
  SET fname='Susan'
  WHERE fname = 'John';
  DBMS_OUTPUT.PUT_LINE('Total number of rows impacted: ' || sql%rowcount);
END;
```

If we run this code, we’ll get this output:

1 row(s) updated.
Total number of rows impacted: 1

It says that 1 row is impacted by our update statement. The row is also updated: that UPDATE statement is executed. If we run a SELECT query on the table, we’ll see the new value:

**FNAME**
Susan

Now, let’s run our earlier code and see what happens:

``` sql
1 row(s) updated.
Total number of rows impacted: 0
```

**It says 0 rows are impacted** (even though the output also says “1 row(s) updated”). This is because the WHERE clause means the statement is looking for a row of “John”, but the value in the row is equal to “Susan”, so it is not updated.

Another way of checking for rows being updated is to use the **%FOUND** and **%NOTFOUND** attributes, rather than %ROWCOUNT.

The **%FOUND** attribute will return true if at least one row is impacted by an INSERT, UPDATE, or DELETE statement, otherwise, it will return false. 

The %**NOTFOUND** attribute is the opposite: it will return true if no rows are impacted and false if at least one row is impacted.

We can change our code to use the %FOUND attribute:

```sql
BEGIN
  UPDATE person
  SET fname='Susan'
  WHERE fname = 'John';
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows not updated.');
  END IF;
END;
```

This output is shown:

1 row(s) updated.
Rows not updated.

The output message says no rows are updated. This is because the WHERE clause doesn’t match any of the existing rows. We can change our UPDATE statement so rows are found:

```sql
BEGIN
  UPDATE person
  SET fname='Mark'
  WHERE fname = 'Susan';
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows not updated.');
  END IF;
END;
```

The output shows:

``` sql
1 row(s) updated.
Rows updated: 1
```


### Example – Using a Cursor with DELETE

The same concept of an implicit cursor applies to a DELETE statement. We can write some code that deletes a row and then displays an output depending on if a row was deleted or not.

```sql
BEGIN
  DELETE FROM person
  WHERE fname = 'Susan';
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows not updated.');
  END IF;
END;
```

This output shows that no rows were deleted.

```sql
1 row(s) deleted.
Rows not updated.
```

This is because no rows have an fname value of “Susan”. If we change it to “Mark” and run the statement again, the row will be deleted.

```sql
BEGIN
  DELETE FROM person
  WHERE fname = 'Mark';
  IF (sql%found) THEN
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || sql%rowcount);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows not updated.');
  END IF;
END;
```

The output shows:
```sql
1 row(s) deleted.
Rows updated: 1.
```


## Explicit Cursors

In Oracle PL/SQL, an explicit cursor is one that is declared by the PL/SQL code. You have more control over it and how the data is handled.  
Using an explicit cursor involves several steps:

1.  Declaring the cursor as a variable in the DECLARE section.
2.  Opening the cursor, which allocates memory for it.
3.  Fetching the cursor, which means the SELECT statement is run and data is stored in the cursor.
4.  Closing the cursor, which releases the allocated memory.

## Example: Explicit Cursors in PL/SQL

To declare a cursor, you add a line into the DECLARE section of your code. It includes your SELECT statement.

```sql
DECLARE
  CURSOR c_person IS
  SELECT fname FROM person;
BEGIN
 
END;
```

As shown above, cursors are declared using this syntax:

```sql
CURSOR cursor_name IS select_statement;
```

Next, we need to open the cursor. This is done in the BEGIN block:

```sql
DECLARE
  CURSOR c_person IS
  SELECT fname FROM person;
BEGIN
  OPEN c_person;
END;
```

Now, we fetch the data from the cursor into a variable.

```sql
DECLARE
  l_fname VARCHAR2(50);
  CURSOR c_person IS
  SELECT fname FROM person;
BEGIN
  OPEN c_person;
  FETCH c_person INTO l_fname;
END;
```

We then have to close the cursor.

```sql
DECLARE
  l_fname VARCHAR2(50);
  CURSOR c_person IS
  SELECT fname FROM person;
BEGIN
  OPEN c_person;
  FETCH c_person INTO l_fname;
  CLOSE c_person;
END;
```

Let’s write the variable to the screen.

```sql
DECLARE
  l_fname VARCHAR2(50);
  CURSOR c_person IS
  SELECT fname FROM person;
BEGIN
  OPEN c_person;
  FETCH c_person INTO l_fname;
  DBMS_OUTPUT.PUT_LINE('Name is: ' || l_fname);
  CLOSE c_person;
END;
```

The output shown here is:

Statement processed.
Name is: John
It shows the name of John.

But there are two records in the table. How can we handle this with our cursor code?




