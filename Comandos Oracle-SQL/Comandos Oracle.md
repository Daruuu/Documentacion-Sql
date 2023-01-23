esctructura de la base de datos seleccionada:
`select * from cat;`

los literales se hacen con comilla simple ' ' por que con doble comilla da errores.
``` sql
SELECT * FROM employees
WHERE (salary >= 3500 AND (department_id=50 OR department_id=90))
OR (job_id='IT_PROG' AND salary< 5000);
```

Formato fecha en Oracle es dia-mes-año
``` sql
SELECT employee_id, first_name AS nombre, last_name AS apellido, salary AS salario, hire_date
FROM employees
WHERE hire_date > '17-JUN-95';
```

En oracle hay que usar las comillas simples ' ' y en mysql las comillas dobles.

Para saber el nombre de todas bases de datos de un Sistema :
``` sql
SELECT * FROM CAT;
SELECT * FROM CATALOG;
```

Para ver las tablas de una database :
``` sql
DESC employees;
```



