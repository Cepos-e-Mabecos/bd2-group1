CREATE OR REPLACE VIEW Select_Employees
AS
 SELECT employees.employee_cod,
    (employees.first_name || ' ' ||  employees.last_name)
   FROM employees;