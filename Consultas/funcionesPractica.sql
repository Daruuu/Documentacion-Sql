
-- EMPLOYEES
SELECT * FROM Employees.employees;
SELECT * FROM job_history;
SELECT * FROM regions;
SELECT * FROM departments;
-- STRINGS

-- SUBSTR
SELECT * FROM employees;
SELECT employee_id id, first_name name, phone_number telephone, 
substr(phone_number, 8,5) extract_digits_phone
FROM employees;

-- REPLACE

SELECT * FROM countries;
SELECT *, REPLACE(country_name, "States","aeiou") pais_modificado
FROM countries;


SELECT * FROM AnimalHospital.Medications;

SELECT Medication_Name, replace( "Aspertane", "tane", "uuu") reemplazar
FROM Medications;


-- TRIM
SELECT * FROM Employees.departments;
SELECT * FROM Employees.job_history;

SELECT * FROM Employees.locations;
SELECT location_id id, street_address,city, TRIM(street_address) street_trim
FROM locations;

SELECT TRIM(" " FROM street_address)
FROM locations;





-- LTRIM 

SELECT LENGTH("    street_addres ") length_str
FROM dual;

SELECT LENGTH("    street_addres ") before_ltrim, LENGTH(LTRIM("    street_addres ")) after_ltrim
FROM dual;

-- RTRIM

SELECT LENGTH(" aeiou_abcde     ") before_ltrim, LENGTH(RTRIM(" aeiou_abcde     ")) after_ltrim
FROM dual;

SELECT * FROM Employees.job_grades;

-- LENGTH
SELECT * FROM AnimalHospital.Animals;
SELECT * FROM AnimalHospital.Customer;

SELECT Customer_Number, Customer_Name name, length(Customer_Name) length_name
FROM AnimalHospital.Customer;

SELECT Customer_Number, Customer_Name name, length(Customer_Name) length_name
FROM AnimalHospital.Customer
WHERE length(Customer_Name) < 15
ORDER BY Customer_Number ;

-- INSTR

SELECT * FROM Pets;

SELECT Customer_Number id_customer, Pet_Name, colors, instr(colors, "n")
FROM Pets;

SELECT Customer_Number id_customer, Pet_Name, colors, instr(colors, "n")
FROM Pets
WHERE instr(colors, "n") >4
ORDER BY Pet_Name;

-- CONCAT

SELECT * FROM employees;
SELECT employee_id, concat(first_name," ",last_name) nombre_apellido, email
FROM employees;

SELECT * FROM Employees.employees;
SELECT employee_id, concat(manager_id,"-",department_id) manager_departID,
email, salary
FROM employees;

-- CONCAT ORACLE
SELECT employee_id, first_name || ' ' || last_name nombre_apellido, email
FROM employees;

SELECT * FROM Visit_Details;
SELECT * FROM Visits;
-- CONCAT
SELECT Pet_ID id, Date_Paid, Amount_Paid, Total_Amount, 
concat(Amount_Paid," ",Total_Amount) cantidad_pago_total_pagado
FROM Visits
WHERE Amount_Paid <> Total_Amount
ORDER BY Amount_Paid desc;

-- LOWER

SELECT * FROM pueblos.articulos;
SELECT COUNT(*) FROM pueblos.articulos;

SELECT codart, descrip, lower(descrip), length(descrip) length_descrip 
FROM pueblos.articulos
WHERE instr(descrip, "10.0 M")
ORDER BY codart;

-- UPPER

SELECT * FROM sakila.actor;
SELECT * FROM sakila.address;

SELECT address_id id, address, upper(address) upp_address, district, upper(district) upp_district
FROM sakila.address
WHERE length(address) > 34
ORDER BY address_id;

-- INITCAP
SELECT INITCAP( 'hi john' )
FROM DUAL;

SELECT * FROM City;
SELECT *, initcap(country_code) 
FROM City;


-- LPAD

SELECT * FROM sakila.country;
SELECT country_id , country, lpad(country, 20, "pais-")
FROM country
WHERE country LIKE("S%a")
ORDER BY country_id;

-- RPAD

SELECT * FROM sakila.customer;

SELECT customer_id, first_name name, last_name surname, 
concat(first_name," ",last_name ) name_surname, address_id 
FROM sakila.customer;

SELECT customer_id, first_name name, last_name surname, 
concat(first_name," ",last_name ) name_surname, 
rpad(concat(first_name," - ", last_name), 20, "12345") name_surname
FROM sakila.customer;




-- NUMERIC

SELECT * FROM AnimalHospital.Animals;
SELECT * FROM AnimalHospital.Pets;
-- ABS()

SELECT Pet_ID, Pet_Name, Breed, Gender, Length, Weight, abs(weight) abs_weight 
FROM AnimalHospital.Pets;

SELECT ABS(-245.2) FROM dual;

-- SIGN()

SELECT * FROM hr.jobs;


SELECT * FROM Neptuno.Categorías;
SELECT * FROM Neptuno.Clientes;

-- CEIL()

SELECT * FROM Neptuno.Pedidos;

SELECT IdPedido, IdCliente, IdEmpleado, Cargo, ceil(cargo) ceil_cargo
FROM Neptuno.Pedidos;

-- FLOOR()
SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, floor(preciounidad) num_entero_precio
FROM Productos;

-- ROUND

SELECT * FROM Neptuno.Productos;

SELECT IdProducto, NombreProducto, CantidadPorUnidad, 
PrecioUnidad, round(preciounidad, 2) round_precio, UnidadesEnExistencia
FROM Productos
WHERE PrecioUnidad < 20.0000
ORDER BY UnidadesEnExistencia DESC;


-- TRUNCATE

SELECT * FROM AnimalHospital.Visit_Details;

SELECT Visit_Number, Visit_Type, Medication_Price, truncate(medication_price, 2) 
FROM AnimalHospital.Visit_Details;

-- MOD
SELECT * FROM AnimalHospital.Visit_Details;

SELECT Visit_Number, Visit_Type, Treatment_Price,
Medication_Price, mod(Medication_Price, 2 ) mod_price
FROM AnimalHospital.Visit_Details
WHERE Treatment_Price < 32.0000;

SELECT Visit_Number, Visit_Type, Treatment_Price,
Medication_Price, Medication_Price MOD 2 mod_price
FROM AnimalHospital.Visit_Details
WHERE Treatment_Price < 15.0000;

SELECT remainder(24,3)
FROM DUAL;

-- POWER
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

-- SQRT
SELECT SQRT(25)  FROM dual;
SELECT SQRT(-25) FROM dual;

SELECT * FROM Employees.employees;

SELECT employee_id, first_name, job_id, salary, commission_pct,
sqrt(salary) sqrt_salary, floor(sqrt(salary)) abs_sqrt_salary
FROM Employees.employees;

SELECT * FROM Employees.employees;

SELECT employee_id, first_name, job_id, salary, 
sqrt(salary) sqrt_salary, floor(sqrt(salary)) abs_sqrt_salary, commission_pct
FROM Employees.employees
WHERE job_id IN("IT_PROG") OR commission_pct = NULL;

SELECT SQRT(256) FROM dual;

-- DATETIME

-- MONTHS_BETWEEN

SELECT * FROM Employees.employees;
SELECT * FROM Employees.job_history;

SELECT *, MONTHS_BETWEEN(start_date, end_date) months_between
FROM job_history;

SELECT TRIM('MAAI NOMBRE  ES DARUNAAY')
-- TRIM('A' FROM 'MAAI NOMBRE  ES DARUNAAY')
FROM DUAL;

SELECT TRIM('MAAI NOMBRE  ES DARUNAAY' FROM 'AA'),
TRIM('A' FROM 'MAAI NOMBRE  ES DARUNAAY')
FROM DUAL;

-- DATETIME

-- MONTHS_BETWEEN

SELECT * FROM Employees.employees;
SELECT * FROM Employees.job_history;

SELECT *, MONTHS_BETWEEN(start_date, end_date) months_between
FROM job_history;

SELECT EXTRACT( YEAR FROM TO_DATE('31-Dec-1999 15:30:20',
'DD-Mon-YYYY HH24:MI:SS')) extract_year
FROM DUAL;