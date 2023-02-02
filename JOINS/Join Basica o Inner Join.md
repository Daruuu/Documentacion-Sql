Las JOINs se usan para combinar filas de dos o más tablas.
Sintaxis:
``` sql
SELECT <columna | expresión> , <columna | expresión>, …
FROM tabla1 JOIN tabla2 ON(tabla1.columna=tabla2.columna);
```
Normalmente 1ro se agrega la tabla **FK** y despues la tabla donde esta la **PK**

La condición que figura dentro del ON, es la condición de “pegado” de ambas tablas. 

Son las columnas `FK` y la `PK` a la que apunta, las tablas que estamos “pegando”.

Para realizar una JOIN de más de 3 o más tablas, se hace de un modo muy sencillo, generalizando:

``` sql
SELECT <columna | expresión> , <columna | expresión>, …
FROM tabla1 JOIN tabla2 ON(tabla1.columna=tabla2.columna)
JOIN tabla3 ON(tabla2.columna=tabla3.columna)
JOIN tabla4 ON(tabla3.columna=tabla4.columna)
…
JOIN tablaN ON(tabla(N-1).columna=tablaN.columna);
```

**Observación 1 Importante:** Si el nombre de alguna columna que pedimos se
encuentra repetido en alguna otra tabla de la Join, la consulta no se 
ejecutará correctamente (se nos quejará de que el nombre de la columna es ambigüo)
Para evitarlo hay que distinguir las columnas mediante el identificador de tabla:
``` sql
tabla1.columna, tabla2.columna
```

Ejemplo:
Juntamos la información de cada Empleado con su Departamento:
``` sql
SELECT * FROM EMPLOYEES JOIN DEPARTMENTS
ON(EMPLOYEES.department_id=DEPARTMENTS.department_id);
```

Ejemplos:
INNER JOIN de 2 TABLAS
``` sql
SELECT * FROM CUSTOMER;
SELECT * FROM PETS;

SELECT C.customer_number, C.customer_name, P.pets_id, P.pet_name, P.type_of_animal
FROM CUSTOMER C JOIN PETS P ON(C.customer_number = P.customer_number)
WHERE pet_name LIKE('S%');
```

INNER JOIN de 3 TABLAS = (2+1)



