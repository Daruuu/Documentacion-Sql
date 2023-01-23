-- descripcion de unatabla
describe employees;

select * from employees;
select  * from countries;

select * FROM provincias;

SELECT employee_id, first_name, phone_number, salary
FROM employees;

SELECT employee_id, first_name, phone_number, salary, 2* salary
FROM employees;

-- WHERE
SELECT employee_id, first_name AS nombre, last_name AS apellido, phone_number, salary AS "salario mensual"
FROM employees
WHERE salary > 10000;

SELECT employee_id, first_name AS nombre, last_name AS apellido, phone_number, salary AS 'salario mensual'
FROM employees
WHERE salary > 10000;

SELECT * FROM employees
WHERE salary >= 6000 AND salary <= 10000;

SELECT * FROM employees
WHERE (salary >= 3500 AND (department_id=50 OR department_id=90))
OR (job_id="IT_PROG" AND salary< 5000);

-- solo funcioanaria en ORACLE por el formato en hire_date
SELECT employee_id, first_name AS nombre, last_name AS apellido, salary AS salario, hire_date
FROM employees
WHERE hire_date > '1995-06-08';

-- comparaciones con STRINGs
SELECT employee_id, first_name AS nombre, last_name AS apellido, salary AS salario, hire_date
FROM employees
WHERE first_name>'Peter';


-- IN

select * from employees
where department_id IN (10,40,80);

-- NOT IN
select * from employees
where department_id NOT IN (10,40,80);

