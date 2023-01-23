**CONSULTAS PROBANDO FUNCIONES**

Aquí tienes un listado de las que considero más importantes.

Asegúrate de que las has probado y sabes para qué sirven y cómo se 
utilizan.

## Single ROW Functions


### **1. Character Functions**

#### 1. SUBSTR()
Extrae una subcadena de una cadena de caracteres especificada.
`SUBSTR(string, start, length);`
MYSQL
``` mysql
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
reemplaza una _subcadena_ en una cadena de caracteres con otra subcadena.

MYSQL
``` mysql
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
elimina los espacios en blanco al principio y al final de una cadena de caracteres.

NO FUNCIONA PARA UNA COLUMNA 
MYSQL
``` mysql
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
```

#### 4. LTRIM()
elimina los caracteres especificados de la **izquierda** de una cadena.

MYSQL
``` mysql
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
elimina los caracteres especificados de la **derecha** de una cadena.

MYSQL
``` mysql
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

DATABASE ANIMALHOSPITAL

#### 6. LENGTH()
devuelve la **longitud** de una cadena de caracteres

MYSQL
``` mysql
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
devuelve la **posición** de un carácter o subcadena dentro de una _cadena de caracteres_.

MYSQL
``` mysql
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

MYSQL
``` mysql
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
```

#### 9. LOWER()
convierte todos los caracteres de una cadena a minúsculas.

MYSQL
``` mysql
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
convierte todos los caracteres de una cadena a mayúsculas.

MYSQL
``` mysql
SELECT * FROM sakila.address;

SELECT address_id id, address, upper(address) upp_address, district, upper(district) upp_district
FROM sakila.address
WHERE length(address) > 34
ORDER BY address_id;
```

ORACLE
``` sql
SELECT * FROM CATEGORY;

SELECT C.*, upper(name)
FROM CATEGORY C;

SELECT C.*, upper(name) upp_name, upper(name) || '--' || last_update
FROM CATEGORY C;

```

#### 11. INITCAP()
MYSQL
``` mysql

```

ORACLE
``` sql
```
  

#### 12. LPAD()
agrega _caracteres_ a la __izquierda__ de una cadena hasta alcanzar una longitud específica.
`LPAD(_string_, _length_, _lpad_string_)`

MYSQL
``` mysql
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
agrega caracteres a la derecha de una cadena hasta alcanzar una longitud específica.
`RPAD(_string_, _length_, _rpad_string_)`

MYSQL
``` mysql
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
  

TO_CHAR( number , ' _format_ ')
Format models (for example) in: [https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34570](https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm#i34570)

SOUNDEX (aplica ejemplos mirando [Words with the Same Pronunciation (thefreedictionary.com)](https://www.thefreedictionary.com/Words-with-the-same-pronunciation.htm#:~:text=There%20are%20also%20the%20following%20groups%20of%20words,8%20poor%20-%20pore%20-%20pour%20M%C3%A1s%20elementos) )
TRANSLATE

_Interesantes, aunque requieren más dedicación:_
REGEXP_REPLACE
REGEXP_SUBSTR



MYSQL
``` mysql

```

ORACLE
``` sql

```


### **2. Numeric Functions**

#### 1. ABS()
returns the absolute (positive) value of a number.
`ABS(number)`

MYSQL
``` mysql
SELECT Pet_ID, Pet_Name, Breed, Gender, Length, Weight, abs(weight) abs_weight 
FROM AnimalHospital.Pets;
```

ORACLE
``` sql

```

### 2. SIGN()

returns the sign of a number.
This function will return one of the following:

-   If number > 0, it returns 1
-   If number = 0, it returns 0
-   If number < 0, it returns -1

`SIGN(number)`

MYSQL
``` mysql
SELECT * FROM Neptuno.Pedidos;

SELECT IdPedido, IdCliente, IdEmpleado, Cargo, sign(cargo) sign_cargo
FROM Neptuno.Pedidos;
```

ORACLE
``` sql

```

#### 3. CEIL()

returns the **smallest integer** value that is bigger than or equal to a number.
is equal to the [CEILING()](https://www.w3schools.com/sql/func_mysql_ceiling.asp) function.
redondea un número al entero más cercano que es mayor que el número dado.

Syntax : `CEIL(number)`

MYSQL
``` mysql
SELECT * FROM Neptuno.Pedidos;

SELECT IdPedido, IdCliente, IdEmpleado, Cargo, ceil(cargo) ceil_cargo
FROM Neptuno.Pedidos;

```

ORACLE
``` sql

```

#### 4. FLOOR()

redondea un número al entero más cercano que es **menor** que el número dado.

Syntax : `FLOOR(number)`

MYSQL
``` mysql
SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, floor(preciounidad) num_entero_precio
FROM Productos;
```

ORACLE
``` sql

```

#### 5. ROUND (number)
rounds a number to a specified number of **decimal** places.
redondea un número a un número especificado de dígitos decimales.
Syntax : `ROUND(number, decimals)`

MYSQL
``` mysql
SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, round(preciounidad, 2) round_precio, UnidadesEnExistencia
FROM Productos
WHERE PrecioUnidad < 20.0000
ORDER BY UnidadesEnExistencia DESC;
```

ORACLE
``` sql

```

#### 6. TRUNC (number)
trunca un número, al número especificado de lugares decimales.
`TRUNCATE(number, decimals)`

MYSQL
``` mysql
SELECT * FROM AnimalHospital.Visit_Details;

SELECT Visit_Number, Visit_Type, Medication_Price, truncate(medication_price, 2) 
FROM AnimalHospital.Visit_Details;
```

ORACLE
``` sql

```

#### 7. MOD()
returns the remainder of a number divided by another number
devuelve el resto de una división específica.

Syntax : 
`MOD(x, y)`
`x MOD y`
`x % y`

MYSQL
``` mysql

```

ORACLE
``` sql

```

#### 8. REMAINDER()


MYSQL
``` mysql

```

ORACLE
``` sql

```

#### 9. POWER()
returns the value of a number raised to the power of another number.
Syntax : `POWER(x, y)`
x : (the base)
y : (the exponent)

MYSQL
``` mysql

```

ORACLE
``` sql

```
#### 10. SQRT()

returns the square root of a number.
Syntax: `SQRT(number)`

MYSQL
``` mysql

```

ORACLE
``` sql

```
