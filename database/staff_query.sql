SELECT managers.employee_id,
       managers.name,
       managers.salary
FROM
    current_employees
INNER JOIN 
    managers ON managers.employee_id = current_employees.employee_id;

SELECT * FROM current_employees
SELECT * FROM managers

SELECT current_employees.employee_id,
       current_employees.name,
       managers.salary,
       current_employees.manager_id
FROM
    current_employees
LEFT OUTER JOIN 
    managers ON current_employees.employee_id = managers.employee_id;

SELECT employees.employee_id,
       employees.name,
       employees.manager_id,
       managers.name AS manager_name
FROM
    current_employees employees
INNER JOIN 
    current_employees managers ON employees.manager_id = managers.employee_id;