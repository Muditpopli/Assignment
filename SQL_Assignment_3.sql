ALTER TABLE employees
DROP INDEX email;
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary >= 30000);
SHOW CREATE TABLE employees;
