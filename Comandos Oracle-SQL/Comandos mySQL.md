ver la estructura de una tabla determinada
``` sql
desc nombretabla;
```

No se puede poner el ALIAS en una condicion `WHERE`.
**NO** funciona correctamente
``` sql
SELECT employee_id, first_name AS nombre, last_name AS apellido, phone_number, salary AS salario_mensual
FROM employees
WHERE salario_mensual > 10000;
```

funciona correctamente
``` sql
SELECT employee_id, first_name AS nombre, last_name AS apellido, phone_number, salary AS salario_mensual
FROM employees
WHERE salary > 10000;
```
``
Podemos utilizar los signos de `>,<,=, !=` tambien con strings peroen caso de ordanar se realiza alfabeticamente.

El formato fecha en **SQL** tiene año-mes-dia-hora
``` sql
SELECT employee_id, first_name AS nombre, last_name AS apellido, salary AS salario, hire_date
FROM employees
WHERE hire_date > '1995-06-08';
```

Para saber el nombre de todas bases de datos de un Sistema :
``` mysql
SHOW databases;
```

Para USAR una database :
``` mysql
USE employees;
```

Para ver las tablas de una database :
``` mysql
DESC employees;
```



## 2.3 Clausula DISTINT

Hace que **NO SE MUESTREN** las filas duplicadas de la selección del resultado.
Observa las diferencias entre las siguientes consultas:
``` mysql
SELECT department_id
FROM EMPLOYEES;

SELECT DISTINCT department_id
FROM EMPLOYEES;
```

``` mysql
SELECT job_id, manager_id
FROM EMPLOYEES;

SELECT DISTINCT job_id, manager_id
FROM EMPLOYEES;
(aquí selecciona las parejas de (job_id, manager_id) diferentes )
```

##  2.4 Selección de filas que cumplen determinadas condiciones: la cláusula

WHERE

La cláusula WHERE nos permite especificar unos criterios de búsqueda 
para poder seleccionar únicamente las filas que cumplen unas 
determinadas condiciones.
La potencia y complejidad de la cláusula WHERE es prácticamente ilimitada gracias a los operadores disponibles para efectuar operaciones.
Aparte de los operadores lógicos y de comparación, podemos incluir operadores
aritméticos (+, -,* *, /) , funciones incorporadas en el SGBD …


``` sql
SELECT <columna | expresión>, <columna | expresión>, …
FROM tabla
WHERE condiciones;
```

### 2.4.1 OPERADORES DE COMPARACIÓN:

Se pueden usar tanto para comparar números como para textos y fechas.

![[Pasted image 20230109193605.png]]

### 2.4.2 OPERADORES LÓGICOS:

![[Pasted image 20230109193854.png]]

``` sql
SELECT * FROM EMPLOYEES
WHERE salary>15000;

SELECT * FROM EMPLOYEES
WHERE department_id!=80;

SELECT * FROM EMPLOYEES
WHERE hire_date>='1999-01-01';(si MySQL y/o formato fecha)

SELECT * FROM EMPLOYEES
WHERE hire_date>='01-01-1999';(si Oracle y/o formato fecha)

SELECT * FROM EMPLOYEES
WHERE salary>=6000 AND salary<=9000;

SELECT * FROM EMPLOYEES
WHERE (salary>=3500 AND (department_id=50 OR
department_id=90))
OR (job_id="IT_PROG" AND salary<4900)

```


### 2.4.3 OTROS OPERADORES:

Operador IN - NOT IN

Permite obtener registros cuyos valores esten en una lista separada por 
comas.

forma eficaz
``` sql
SELECT * FROM EMPLOYEES
WHERE department_id IN (10,50, 90);
```

``` sql
SELECT * FROM EMPLOYEES
WHERE job_id NOT IN ("AD_VP","ST_CLERK");
```

Las anteriores consultas son equivalentes a estas otras:
forma mas larga
``` sql
SELECT * FROM EMPLOYEES
WHERE department_id=10 OR department_id=50 OR department_id=90;

SELECT * FROM EMPLOYEES
WHERE job_id<>"AD_VP" AND job_id<>"ST_CLERK";
```

OPERADOR BETWEEN - NOT BETWEEN

BETWEEN: Nos permite obtener datos que se encuentren en un rango **(extremos incluidos)**

``` sql
SELECT * FROM EMPLOYEES
WHERE salary BETWEEN 6000 AND 9000;
```

La anterior consulta es equivalente a esta:
``` sql
SELECT * FROM EMPLOYEES
WHERE salary>=6000 AND salary<=9000;
```



``` sql
SELECT * FROM EMPLOYEES
WHERE department_id NOT BETWEEN 30 AND 90;
```

La anterior consulta es equivalente a esta:
``` sql
SELECT * FROM EMPLOYEES
WHERE department_id<30 OR department_id>90;
```

OPERADOR LIKE - NOT LIKE

El operador **LIKE** nos permite comparar una cadena de texto con una cadena 'patrón' que puede contener los caracteres especiales siguientes:

`%` para indicar cualquier cadena de cero o más caracteres
`_` para indicar un carácter cualquiera

Mirar la sintaxis en los siguientes ejemplos:

1) Empleados cuya segunda letra del apellido sea una i :
``` sql
SELECT * FROM EMPLOYEES
WHERE last_name LIKE('_i%') ;
```

2) Empleados cuyo teléfono empieza por 5 y termina por 4:

``` sql
SELECT * FROM EMPLOYEES
WHERE phone_number LIKE '5%4' ;
```

3) Empleados cuyo nombre no contiene la letra a:

``` sql
SELECT * FROM EMPLOYEES
WHERE first_name NOT LIKE '%a%' ;
```

