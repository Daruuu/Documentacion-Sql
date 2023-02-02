**CONSULTAS PROBANDO FUNCIONES**

Aquí tienes un listado de las que considero más importantes.
Asegúrate de que las has probado y sabes para qué sirven y cómo se 
utilizan.

## Single ROW Functions

### **1. Character Functions**

#### 1. SUBSTR()
Extrae una subcadena de una cadena de caracteres especificada.
Syntax: `SUBSTR(string, start, length);`

MYSQL
``` sql
SELECT * FROM employees;
SELECT employee_id id, first_name name, phone_number telephone, 
substr(phone_number, 8,5) extract_digits_phone
FROM employees;
```

ORACLE
``` sql
SELECT * FROM employees;
SELECT employee_id id, first_name name, email, job_id, 
substr(job_id, 1, 3) extract_type_id
FROM employees;
```

#### 2. REPLACE()
Reemplaza una _subcadena_ en una cadena de caracteres con otra subcadena.
Syntax: `REPLACE(str, find_string, replace_with)`

MYSQL
``` sql
SELECT * FROM Employees.Countries;
SELECT *, REPLACE(country_name, "States","aeiou") pais_modificado
FROM countries;

SELECT * FROM AnimalHospital.Medications;
SELECT Medication_Name, replace( "Aspertane", "tane", "uuu") reemplazar
FROM Medications;
```

ORACLE
``` sql
SELECT * FROM countries;
SELECT REPLACE(country_name, 'a','aeiou')
FROM countries;

SELECT * FROM countries;
SELECT C.*, REPLACE(country_name, 'a','aeiou')
FROM countries C;
```

#### 3. TRIM()
Elimina los espacios en blanco al principio y al final de una cadena de caracteres.
Syntax:

MYSQL
``` sql
SELECT * FROM Employees.locations;
SELECT location_id id, street_address,city, TRIM(street_address) street_trim
FROM locations;

SELECT TRIM(street_address)
FROM locations;

SELECT TRIM(" street_address   ")
FROM dual;
```

ORACLE
``` sql
SELECT location_id id, street_address,city, TRIM(street_address) street_trim
FROM locations;

SELECT TRIM(' mi nombre es daruny  ' FROM DUAL);

```

#### 4. LTRIM()
Elimina los caracteres especificados de la **izquierda** de una cadena.
Syntax: `LTRIM(str)`

MYSQL
``` sql
SELECT LENGTH("    street_addres ") length_str
FROM dual;

SELECT LENGTH("    street_addres ") before_ltrim, LENGTH(LTRIM("    street_addres ")) after_ltrim
FROM dual;
```

ORACLE
``` sql
SELECT LENGTH('    colores ') length_str
FROM dual;

SELECT LENGTH('    colores ') before_ltrim, LENGTH(LTRIM('    colores ')) after_ltrim
FROM dual;

```

#### 5. RTRIM()
Elimina los caracteres especificados de la **derecha** de una cadena.
Syntax: `RTRIM(str)`

MYSQL
``` sql
SELECT LENGTH(" aeiou_abcde     ") before_rtrim, LENGTH(RTRIM(" aeiou_abcde     ")) after_rtrim
FROM dual;
```

ORACLE
``` sql
ELECT LENGTH(' colores    ') length_str
FROM dual;

SELECT LENGTH(' colores    ') before_rtrim, LENGTH(RTRIM('    colores ')) after_rtrim
FROM dual;
```

#### 6. LENGTH()
Devuelve la **longitud** de una cadena de caracteres
Syntax: `LENGTH (str)`

MYSQL
``` sql
SELECT * FROM AnimalHospital.Customer;

SELECT Customer_Number, Customer_Name name, length(Customer_Name) length_name
FROM AnimalHospital.Customer
WHERE length(Customer_Name) < 15
ORDER BY Customer_Number;

```

ORACLE
``` sql
SELECT * FROM MEDICATIONS;

SELECT M.*, LENGTH(Medication_Name) as length_medication 
FROM Medications M
WHERE LENGTH(Medication_Name) > 20
ORDER BY M.medication_code;
```

#### 7. INSTR()
Devuelve la **posición** de un carácter o subcadena dentro de una _cadena de caracteres_.
Syntax : `INSTR (original_str, sub_str)`
	original: The string to be searched
	sub_str: The string to be searched for within the original_str.

MYSQL
``` sql
SELECT * FROM Pets;

SELECT Customer_Number id_customer, Pet_Name, colors, instr(colors, "n")
FROM Pets;

SELECT Customer_Number id_customer, Pet_Name, colors, instr(colors, "n")
FROM Pets
WHERE instr(colors, "n") >4
ORDER BY Pet_Name;
```

ORACLE
``` sql
SELECT * FROM PETS;

SELECT pet_id id, pet_name, type_of_animal, INSTR(type_of_animal, 'G')
FROM pets;

SELECT pet_id id, pet_name, type_of_animal, INSTR(type_of_animal, 'G')
FROM pets
WHERE instr(type_of_animal, 'T') <> 4
ORDER BY Pet_Name;
```

#### 8. CONCAT()
concatena dos o más cadenas de caracteres.
Syntax: `CONCAT (string1, string2,…)`

MYSQL
``` sql
SELECT * FROM AnimalHospital.visits;

SELECT Pet_ID id, Date_Paid, Amount_Paid, Total_Amount, 
concat(Amount_Paid," ",Total_Amount) cantidad_pago_total_pagado
FROM Visits
WHERE Amount_Paid <> Total_Amount
ORDER BY Amount_Paid desc;


SELECT * FROM Employees.employees;

SELECT employee_id, concat(manager_id,"-",department_id) manager_departID,
email, salary
FROM employees;
```

ORACLE
``` sql
SELECT * FROM employees;

SELECT employee_id id, first_name name, last_name surname, first_name || ' ' || last_name nombre_apellido, email
FROM employees;

SELECT S.*, S.state_code || '-' || S.state_name
FROM states S;

SELECT CONCAT('focus', ' on yourself')
```

#### 9. LOWER()
Convierte todos los caracteres de una cadena a minúsculas.
Syntax: `LOWER(str)`

MYSQL
``` sql
SELECT * FROM pueblos.articulos;

SELECT codart, descrip, lower(descrip), length(descrip) length_descrip 
FROM pueblos.articulos
WHERE instr(descrip, "10.0 M")
ORDER BY codart;
```

ORACLE
``` sql
SELECT * FROM PUEBLOS;

SELECT * FROM ARTICULOS;
SELECT codart, descrip , length(descrip) length_descrip, lower(descripc)
FROM articulos
WHERE length(descrip) > 32
ORDER BY codart;

```

#### 10. UPPER()
Convierte todos los caracteres de una cadena a mayúsculas.
Syntax: `UPPER(str)`

MYSQL
``` sql
SELECT * FROM sakila.address;

SELECT address_id id, address, upper(address) upp_address, district, upper(district) upp_district
FROM sakila.address
WHERE length(address) > 34
ORDER BY address_id;
```

ORACLE
``` sql
SELECT * FROM sakila.CATEGORY;

SELECT C.*, upper(name)
FROM CATEGORY C;

SELECT * FROM CATEGORY;
SELECT C.*, upper(name) upp_name, upper(name) || '--' || last_update
FROM CATEGORY C;

```

#### 11. INITCAP()

MYSQL
``` sql
SELECT INITCAP( 'hi john' )
FROM DUAL;
```

ORACLE
``` sql
SELECT INITCAP('the colors')
FROM DUAL;
```

#### 12. LPAD()
Agrega _caracteres_ a la __izquierda__ de una cadena hasta alcanzar una longitud específica.
Syntax: `LPAD(_string_, _length_, _lpad_string_)`

MYSQL
``` sql
SELECT * FROM sakila.country;

SELECT country_id , country, lpad(country, 20, "pais-")
FROM country
WHERE country LIKE("%a")
ORDER BY country_id;

SELECT country_id , country, lpad(country, 20, "pais-")
FROM country
WHERE country LIKE("S%a")
ORDER BY country_id;
```

ORACLE
``` sql
SELECT * FROM salika.CITY;

SELECT c.*, LDAP(CITY, 8, 'A   ') lpad_city
FROM CITY C
WHERE length(C.CITY) > 20 OR C.COUNTRY_ID = 50
ORDER BY C.CITY;
```

#### 13. RPAD()
Agrega caracteres a la derecha de una cadena hasta alcanzar una longitud específica.
Syntax: `RPAD(_string_, _length_, _rpad_string_)`

MYSQL
``` sql
SELECT * FROM sakila.customer;

SELECT customer_id, first_name name, last_name surname, 
concat(first_name," ",last_name ) name_surname, address_id 
FROM sakila.customer;

SELECT customer_id, first_name name, last_name surname, 
concat(first_name," ",last_name ) name_surname, 
rpad(concat(first_name," - ", last_name), 20, "12345") name_surname
FROM sakila.customer;

```

ORACLE
``` sql
SELECT * FROM CUSTOMER;

SELECT customer_id, first_name, address_id, RPAD('Store ', store_id), 12, '-BCN') rpad_concat_store
FROM CUSTOMER;
```
  

#### 14. TO_CHAR( number , ' _format_ ')
Format models (for example) in: [https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34570](https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34570)

MYSQL
``` sql
```

ORACLE
``` sql
```


SOUNDEX (aplica ejemplos mirando [Words with the Same Pronunciation (thefreedictionary.com)](https://www.thefreedictionary.com/Words-with-the-same-pronunciation.htm#:~:text=There%20are%20also%20the%20following%20groups%20of%20words,8%20poor%20-%20pore%20-%20pour%20M%C3%A1s%20elementos) )
TRANSLATE

_Interesantes, aunque requieren más dedicación:_
REGEXP_REPLACE
REGEXP_SUBSTR
MYSQL
``` sql
```

ORACLE
``` sql
```

### **2. Numeric Functions**

#### 1. ABS()
Returns the absolute (positive) value of a number.
Syntax: `ABS(number)`

MYSQL
``` sql
SELECT Pet_ID, Pet_Name, Breed, Gender, Length, Weight, abs(weight) abs_weight 
FROM AnimalHospital.Pets;

SELECT ABS(-215.27) FROM dual;
```

ORACLE
``` sql
SELECT ABS(5) FROM dual;

SELECT ABS(-5) FROM dual;

SELECT ABS(-245.2) FROM dual;

```

#### 2. SIGN()
Returns the sign of a number.
This function will return one of the following:
-   If number > 0, it returns 1
-   If number = 0, it returns 0
-   If number < 0, it returns -1

Syntax: `SIGN(number)`

MYSQL
``` sql
SELECT * FROM Neptuno.Pedidos;

SELECT IdPedido, IdCliente, IdEmpleado, Cargo, sign(cargo) sign_cargo
FROM Neptuno.Pedidos;
```

ORACLE
``` sql
SELECT ABS(-423.27) abs_number
FROM DUAL;
```

#### 3. CEIL()
Returns the **smallest integer** value that is bigger than or equal to a number.
is equal to the [CEILING()](https://www.w3schools.com/sql/func_mysql_ceiling.asp) function.
Redondea un número al entero más cercano que es mayor que el número dado.

Syntax: `CEIL(number)`

MYSQL
``` sql
SELECT * FROM Neptuno.Pedidos;

SELECT IdPedido, IdCliente, IdEmpleado, Cargo, ceil(cargo) ceil_cargo
FROM Neptuno.Pedidos;

```

ORACLE
``` sql
SELECT CEIL(-423.27) ceil_number1, CEIL(23.777) ceil_number2
FROM DUAL;
```

#### 4. FLOOR()
Redondea un número al entero más cercano que es **menor** que el número dado.

Syntax: `FLOOR(number)`

MYSQL
``` sql
SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, floor(preciounidad) num_entero_precio
FROM Productos;
```

ORACLE
``` sql
SELECT FLOOR(12.24* 6) floor_number1, FLOOR(12.24) floor_number2, FLOOR(123.98) floor_number3
FROM DUAL;
```

#### 5. ROUND (number)
Rounds a number to a specified number of **decimal** places.
Redondea un número a un número especificado de dígitos decimales.

Syntax: `ROUND(number, decimals)`

MYSQL
``` sql
SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, round(preciounidad, 2) round_precio, UnidadesEnExistencia
FROM Productos
WHERE PrecioUnidad < 20.0000
ORDER BY UnidadesEnExistencia DESC;
```

ORACLE
``` sql
SELECT * FROM NEPTUNO;

SELECT idproducto, cantidadporunidad, preciounidad, round(preciounidad) round_precio
FROM PRODUCTOS;

SELECT idproducto, cantidadporunidad, preciounidad, round(preciounidad) round_precio_unidad, unidadesenexistencia
FROM PRODUCTOS
WHERE preciounidad BETWEEN 10 AND 18
ORDER BY unidadesenexistencia;
```

#### 6. TRUNC (number)
Trunca un número, al número especificado de lugares decimales.
Syntax: `TRUNCATE(number, decimals)`

MYSQL
``` sql
SELECT * FROM AnimalHospital.Visit_Details;

SELECT Visit_Number, Visit_Type, Medication_Price, truncate(medication_price, 2) 
FROM AnimalHospital.Visit_Details;
```

ORACLE
``` sql
SELECT * FROM DETALLES_DE_PEDIDOS;

SELECT P.*, TRUNCATE(preciounidad, 0)
FROM DETALLES_DE_PEDIDOS P;
```

#### 7. MOD()
Returns the remainder of a number divided by another number
Devuelve el resto de una división específica.
Syntax: 
`MOD(x, y)`
`x MOD y`
`x % y`

MYSQL
``` sql
SELECT * FROM AnimalHospital.Visit_Details;

SELECT Visit_Number, Visit_Type, Treatment_Price,
Medication_Price, Medication_Price MOD 2 mod_price
FROM AnimalHospital.Visit_Details


SELECT Visit_Number, Visit_Type, Treatment_Price,
Medication_Price, mod(Medication_Price, 2 ) mod_price
FROM AnimalHospital.Visit_Details
WHERE Treatment_Price < 32.0000;
```

ORACLE
``` sql
SELECT * FROM DETALLES_DE_PEDIDOS;

SELECT P.*, MOD(preciounidad, 2) resiudo_precio
FROM DETALLES_DE_PEDIDOS P;
```

#### 8. REMAINDER()
Esta función devuelve el residuo de n2 dividido por n1. n1 y n2 son los argumentos de esta función.
Syntax: `REMAINDER(n2, n1)`

La función __MOD__ es similar a REMAINDER excepto que MOD usa FLOOR en su fórmula, mientras que REMAINDER usa ROUND.

MYSQL
``` sql
SELECT remainder(24,3)
FROM DUAL;
```

ORACLE
``` sql
SELECT P.*, REMAINDER(PRECIOUNIDAD, 2) residuo_precio
FROM DETALLES_DE_PEDIDOS P;
```

#### 9. POWER()
Returns the value of a number raised to the power of another number.
La función POWER de Oracle se utiliza para devolver el valor de un número elevado a la potencia de otro número.

Syntax: `POWER(x, y)`
x : (the base)
y : (the exponent)

MYSQL
``` sql
SELECT * FROM AnimalHospital.Visit_Details;
SELECT visit_type, Treatment_price, Medication_Price,
power(medication_price, 2) power_price
FROM Visit_Details;

SELECT * FROM AnimalHospital.Visit_Details;
SELECT visit_type, Treatment_price, Medication_Price,
power(medication_price, 2) power_price
FROM Visit_Details
WHERE Medication_Price <> 0 AND (Medication_Price > 10.0000 AND
power(medication_price, 2)  < 1000);

SELECT POWER(8, 3);
```

ORACLE
``` sql
SELECT POWER(3, 2) potencia
FROM dual;

SELECT * FROM DETALLES_DE_PEDIDOS;
SELECT P.*, POWER(PRECIOUNIDAD, 2) potencia_precio
FROM DETALLES_DE_PEDIDOS P;

SELECT * FROM DETALLES_DE_PEDIDOS;
SELECT P.*, POWER(PRECIOUNIDAD, 2) potencia_precio
FROM DETALLES_DE_PEDIDOS P
WHERE CANTIDAD >40 AND POWER(PRECIOUNIDAD, 2) < 80;

SELECT * FROM DETALLES_DE_PEDIDOS;
SELECT P.*, POWER(PRECIOUNIDAD, 2) potencia_precio
FROM DETALLES_DE_PEDIDOS P
WHERE CANTIDAD >40 AND POWER(PRECIOUNIDAD, 2) < 80
ORDER BY 2, 1;
```

#### 10. SQRT()
Returns the square root of a number.
Syntax: `SQRT(number)`

MYSQL
``` sql
SELECT SQRT(-25) FROM dual; -- DA NULL
SELECT SQRT(256) FROM dual;

SELECT * FROM Employees.employees;
SELECT employee_id, first_name, job_id, salary, 
sqrt(salary) sqrt_salary, floor(sqrt(salary)) abs_sqrt_salary
FROM Employees.employees;

SELECT * FROM Employees.employees;
SELECT employee_id, first_name, job_id, salary, 
sqrt(salary) sqrt_salary, floor(sqrt(salary)) abs_sqrt_salary
FROM Employees.employees
WHERE job_id IN("IT_PROG");

SELECT * FROM Employees.employees;
SELECT employee_id, first_name, job_id, salary, 
sqrt(salary) sqrt_salary, floor(sqrt(salary)) abs_sqrt_salary, commission_pct
FROM Employees.employees
WHERE job_id IN("IT_PROG") OR commission_pct = NULL;
```

ORACLE
``` sql
SELECT * FROM EMPLOYEES;
SELECT employee_id, first_name, job_ib, salary, sqrt(salary) salary_sqrt
FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT employee_id, first_name, job_ib, salary, sqrt(salary) salary_sqrt,
ceil(sqrt(salary)) ceil_sqrt_salary
FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT employee_id, first_name, job_ib, salary, sqrt(salary) salary_sqrt,
ceil(sqrt(salary)) ceil_sqrt_salary
FROM EMPLOYEES
WHERE ceil(sqrt(salary)) < 200
ORDER BY 2;

SELECT SQRT(25) FROM dual;
SELECT SQRT(296) FROM dual;
```

### **3. Datetime Functions**

#### 1. MONTHS_BETWEEN

MYSQL
``` sql
```
Permite calcular el número de meses entre dos fechas.
Si `date1` es posterior a `date2`, entonces el resultado es **POSITIVO**.
Si `date1` es anterior a `date2`, el resultado es **NEGATIVO**.
Syntax: `MONTHS_BETWEEN(date1, date2)`

ORACLE
``` sql
SELECT * FROM EMPLOYEES;
-- MOSTRARA LA CANTIDA DE MESES EN NEGATIVO
SELECT * FROM JOB_HISTORY;
SELECT J.*, MOTNHS_BETWEEN(START_DATE, END_DATE) months_between
FROM JOB_HISTORY;

-- MOSTRARA LA CANTIDA DE MESES EN POSITIVO
SELECT * FROM JOB_HISTORY;
SELECT J.*, MOTNHS_BETWEEN(END_DATE,START_DATE) months_between
FROM JOB_HISTORY;

SELECT * FROM JOB_HISTORY;
SELECT J.*, MONTHS_BETWEEN(START_DATE, END_DATE) months_between, 
ABS(MONTHS_BETWEEN(START_DATE, END_DATE))abs_months_between,
ROUND(MONTHS_BETWEEN(END_DATE,START_DATE),2)"round 2 deci"
FROM JOB_HISTORY J;
```

#### 2. ADD_MONTHS
MYSQL
``` sql
```

Retorna un `DATE` pero con el mes actualizado, segun el segundo parametro de la funcion.
Syntax: `ADD_MONTHS(date, integer)`
Example: 
`ADD_MONTHS('05-JAN-14', 7)`
01 + 7 = 08 == AUG
05-JAN-14 +7 => 05- AUG-14
Output: `05-AUG-14`
ORACLE
``` sql
SELECT * FROM EMPLOYEES;
SELECT hire_date, TO_CHAR(ADD_MONTHS(hire_date, -1), 'DD-MON-YYYY') "Previous month",
TO_CHAR(ADD_MONTHS(hire_date, 1), 'DD-MON-YYYY') "Next month"
FROM employees 
WHERE first_name = 'Lex';

SELECT * FROM EMPLOYEES;
SELECT hire_date, TO_CHAR(ADD_MONTHS(hire_date, -1), 'DD-MON-YYYY') "Previous month",
TO_CHAR(ADD_MONTHS(hire_date, 1), 'DD-MON-YYYY') "Next month"
FROM employees 
WHERE employee_id BETWEEN 120 AND 174;
```

#### 3. EXTRACT (datetime)
MYSQL
``` sql
```

La función EXTRACT en Oracle SQL se utiliza para obtener una parte específica de una fecha o timestamp.
The Oracle `EXTRACT()` function extracts a specific component `(year, month, day, hour, minute, second, etc.,)` from a datetime or an interval value.
DATE : `YEAR, MONTH, DAY, HOUR, MINUTE, SECOND`
TIMESTAMP: `YEAR, MONTH, DAY, HOUR, MINUTE, SECOND`

Syntax: `EXTRACT(DATE FROM '31-Dec-1999 15:30:20')`

ORACLE
``` sql
SELECT EXTRACT( YEAR FROM TO_DATE('31-Dec-1999 15:30:20',
'DD-Mon-YYYY HH24:MI:SS')) extract_year
FROM DUAL;

SELECT * FROM EMPLOYEES;
SELECT employee_id, first_name || '-' || last_name full_name, hire_date, EXTRACT(YEAR FROM hire_date) extract_year, EXTRACT(MONTH FROM hire_Date) extract_month
FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT employee_id, first_name||'-'||last_name full_name, hire_date, 
EXTRACT(YEAR FROM hire_date) extract_year,
EXTRACT(MONTH FROM hire_Date) extract_month
FROM EMPLOYEES
WHERE EXTRACT(MONTH FROM hire_date) = 1;
```

#### 4. LAST_DAY

MYSQL
``` sql
```

The `LAST_DAY()` function returns the last day of the month that contains a date. 
The return type is always `DATE`, regardless of the datatype of date.
Syntax: `LAST_DAY(date)`

ORACLE
``` sql
SELECT SYSDATE,LAST_DAY(SYSDATE) lastday,
LAST_DAY(SYSDATE)-SYSDATE Days_Left
FROM DUAL;

SELECT LAST_DAY(SYSDATE) ultimo_dia_mes
FROM DUAL;

SELECT * FROM employees;
SELECT last_name, hire_date,
TO_CHAR(ADD_MONTHS(LAST_DAY(hire_date), 5)) "5 meses mas"
FROM employees;

SELECT * FROM SAKILA;
SELECT * FROM CITY;
SELECT C.*, LAST_DAY(last_update) last_update
FROM city C;

```

#### 5. NEXT_DAY

MYSQL
``` sql
```

`NEXT_DAY` returns the date of the first weekday that is later than the date.
se utiliza para obtener la fecha del día de la semana siguiente de un día específico.
en parametro `char`: se puede poner como string es decir "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" o "SUNDAY" ; o tambien pasar su equivalente a numero `1-7`.

Syntax: `NEXT_DAY(date, char)`

ORACLE
``` sql
SELECT * FROM CUSTOMER;
SELECT customer_id, first_name || '-' || last_name full_name, last_update, NEXT_DAY(last_update, 6) next_day_char
FROM CUSTOMER;

SELECT * FROM CUSTOMER;
SELECT customer_id,lower(first_name || '-' || last_name) full_name_lower, last_update, NEXT_DAY(last_update, 6) next_day_char, NEXT_DAY(last_update, 'sabado') next_day_string 
FROM CUSTOMER;
```

#### 6. ROUND(date)

MYSQL
``` sql

```

La función `ROUND` se utiliza para redondear una **fecha** a un cierto nivel de precisión temporal.
Hay que especificar el nivel de precision temporal en el cual queremos REDONDEAR la fecha, utilizando el formato.
fmt: `"YEAR", "MONTH", "DAY", "HOUR", "MINUTE" o "SECOND"`

Syntax: `ROUND(date [,fmt ])`
Retorna el primer 
ORACLE
``` sql
SELECT ROUND(TO_DATE ('16-SEP-2015'),'MONTH') new_month,
ROUND(TO_DATE ('16-SEP-2015'),'YEAR') new_year
FROM DUAL;

SELECT * FROM CUSTOMER;
SELECT customer_id, first_name, last_update, 
ROUND(last_update, 'YEAR') round_year,
ROUND(last_update, 'MONTH') round_month
FROM CUSTOMER;

SELECT * FROM ANIMAL_HOSPITAL.CUSTOMER;
SELECT * FROM CUSTOMER;
SELECT customer_number, customer_name, city, customer_since, 
last_visit_date
FROM CUSTOMER;

SELECT * FROM CUSTOMER;
SELECT customer_number, customer_name, city, customer_since, 
last_visit_date, ROUND(customer_since, 'YEAR') customer_since_year
FROM CUSTOMER;

SELECT * FROM CUSTOMER;
SELECT customer_number, customer_name, city, customer_since, 
last_visit_date, 
ROUND(customer_since, 'YEAR') customer_since_year,
NEXT_DAY(last_visit_date, 'LUNES') nextvisit_lunes
FROM CUSTOMER;

```

#### 7. TRUNC (date)

MYSQL
``` sql
```

Se utiliza para obtener la fecha con la parte de la hora del día truncada en una unidad de medida específica. 
The unit of measure for truncating(fmt)
fmt:  `"YEAR", "MONTH", "DAY", "HOUR", "MINUTE" o "SECOND"`

Syntax: `TRUNC(date [, fmt])`
`SELECT TRUNC(fecha_columna, 'fmt') fecha_truncada FROM tabla;`

ORACLE
``` sql
SELECT TO_DATE('02-MAR-15','DD-MON-YY') fecha_normal, TRUNC(TO_DATE('02-MAR-15','DD-MON-YY'), 'YEAR') fecha_trunc_year
FROM DUAL;

SELECT * FROM ANIMAL_HOSPITAL.CUSTOMER;
SELECT * FROM CUSTOMER;
SELECT customer_number, customer_name, city, customer_since, 
last_visit_date, TRUNC(last_visit_date,'YEAR') trunc_year,
TRUNC(last_visit_date, 'DAY') trunc_day
FROM CUSTOMER;
```

#### 8. SYSDATE

MYSQL
``` sql

```

ORACLE
``` sql
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY') sysdate_today
FROM DUAL;
```

#### 9.CURRENT_DATE

MYSQL
``` sql

```

ORACLE
``` sql
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY') sysdate_today
FROM DUAL;
```

#### 10.CURRENT_TIMESTAMP

MYSQL
``` sql

```

ORACLE
``` sql
SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY') sysdate_today
FROM DUAL;
```

#### 11. EXTRACT (_datetime_)

MYSQL
``` sql
```

ORACLE
``` sql
```

#### 12. TO_CHAR( date , ' _format_ ')

MYSQL
``` sql
```

ORACLE
``` sql
```

Format models (for example) in: [https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34924](https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34924)

TO_DATE( char , ' _format_ ')
nvl
pasar nulos a el numero que queremos

``` sql
SELECT first_name, legnth(first_name),
CASE WHEN LENGTH(first_name) > 7 THEN 'LARGO'
WHEN LEGNTH(first_name) > 5 THEN 'MEDIO'
ELSE 'CORTO' END chorrada, hire_date
```

### **4. Other**

#### 1. DECODE

MYSQL
``` sql
```

ORACLE
``` sql
```


#### 2. CASE
See (for example): [https://www.techonthenet.com/oracle/functions/case.php](https://www.techonthenet.com/oracle/functions/case.php)

MYSQL
``` sql
```
permite evaluar una expresión y devolver un valor diferente basado en varios posibles resultados.
Syntax:
`CASE [ expression ]
   WHEN condition_1 THEN result_1
   WHEN condition_2 THEN result_2
   WHEN condition_n THEN result_n
   ELSE result
END`

ORACLE
``` sql
SELECT table_name,
CASE owner
  WHEN 'SYS' THEN 'The owner is SYS'
  WHEN 'SYSTEM' THEN 'The owner is SYSTEM'
  ELSE 'The owner is another value'
END
FROM all_tables;

SELECT * FROM EMPLOYEES;
SELECT LAST_NAME, JOB_ID,
CASE 
  WHEN JOB_ID LIKE('%CLERK') THEN 'Es un CLERK'
  WHEN JOB_ID LIKE ('%REP') THEN 'Es un REP'
   ELSE 'Es otra cosa' END Clasificacion
FROM EMPLOYEES
ORDER BY LAST_NAME;

```

#### 3. NVL

MYSQL
``` sql
```

Permite reemplazar un valor nulo con otro valor especificado.
Syntax: `NVL(column, valor_reemplazar`

ORACLE
``` sql
SELECT LAST_NAME,
NVL(COMMISSION_PCT, 'No Commission') COMMISSION
FROM EMPLOYEES;
```

#### 4. NVL2

MYSQL
``` sql
```

ORACLE
``` sql
```

  

**Multiple ROW Functions**

  

SUM

AVG

COUNT

MAX

MIN

