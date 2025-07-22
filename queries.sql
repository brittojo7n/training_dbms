CREATE TABLE training_table(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	role VARCHAR(30),
	salary INTEGER
);

INSERT INTO training_table VALUES(
	1, 'John Sullivan', 'Developer', 80000
);

INSERT INTO training_table(name,role,salary)
VALUES('Ann Mary', 'Data Analyst', 105000);

SELECT * FROM training_table;

DELETE FROM training_table WHERE name='Ann Mary';

UPDATE training_table SET role='Data Analyst' WHERE salary=80000

INSERT INTO training_table(name,role,salary)
VALUES('Ann Sullivan', 'Business Analyst', 60000);

INSERT INTO training_table(name,role,salary)
VALUES('Bob Fischer', 'Network Engineer', 78000);

INSERT INTO training_table(name,role,salary)
VALUES('Marry Antoinette', 'Developer', 69000);

INSERT INTO training_table (name, role, salary)
VALUES ('Peter Jones', 'Developer', 95000);

INSERT INTO training_table (name, role, salary)
VALUES ('Susan Bower', 'Data Analyst', 110000);

INSERT INTO training_table (name, role, salary)
VALUES ('Sam Altman', 'Manager', 125000);

SELECT * FROM training_table WHERE salary > 90000;

SELECT * FROM training_table WHERE name LIKE 'A%'

SELECT role, salary FROM training_table WHERE name LIKE 'B%'

SELECT AVG(salary) AS average_salary FROM training_table

SELECT AVG(salary) AS average_salary FROM training_table WHERE role='Data Analyst'

INSERT INTO training_table (name, role, salary) VALUES ('Aarav Sharma', 'DevOps Engineer', 92000);
INSERT INTO training_table (name, role, salary) VALUES ('Priya Patel', 'QA Engineer', 75000);
INSERT INTO training_table (name, role, salary) VALUES ('Rohan Mehta', 'UI/UX Designer', 88000);
INSERT INTO training_table (name, role, salary) VALUES ('Sneha Reddy', 'Product Manager', 130000);
INSERT INTO training_table (name, role, salary) VALUES ('Vikram Singh', 'Systems Administrator', 82000);
INSERT INTO training_table (name, role, salary) VALUES ('Anjali Gupta', 'Scrum Master', 115000);
INSERT INTO training_table (name, role, salary) VALUES ('Karan Malhotra', 'Full Stack Developer', 105000);
INSERT INTO training_table (name, role, salary) VALUES ('Isha Desai', 'Cloud Architect', 140000);
INSERT INTO training_table (name, role, salary) VALUES ('Arjun Nair', 'Security Analyst', 98000);
INSERT INTO training_table (name, role, salary) VALUES ('Neha Joshi', 'Technical Writer', 72000);
INSERT INTO training_table (name, role, salary) VALUES ('Rajesh Kumar', 'Database Administrator', 110000);
INSERT INTO training_table (name, role, salary) VALUES ('Pooja Chauhan', 'Machine Learning Engineer', 135000);
INSERT INTO training_table (name, role, salary) VALUES ('Amit Verma', 'Backend Developer', 99000);
INSERT INTO training_table (name, role, salary) VALUES ('Deepika Singh', 'Frontend Developer', 93000);
INSERT INTO training_table (name, role, salary) VALUES ('Sanjay Rao', 'IT Support Specialist', 65000);
INSERT INTO training_table (name, role, salary) VALUES ('Meera Krishnan', 'AI Researcher', 150000);
INSERT INTO training_table (name, role, salary) VALUES ('Vivek Iyer', 'Solutions Architect', 145000);
INSERT INTO training_table (name, role, salary) VALUES ('Tanvi Shah', 'Mobile App Developer', 97000);
INSERT INTO training_table (name, role, salary) VALUES ('Harish Menon', 'Site Reliability Engineer', 120000);
INSERT INTO training_table (name, role, salary) VALUES ('Geeta Prasad', 'Business Intelligence Analyst', 102000);

INSERT INTO training_table (role, salary) VALUES ('Business Intelligence Analyst', 102000);

UPDATE training_table SET name='Eric Cartman' WHERE role='Business Analyst'
UPDATE training_table SET name='Edward Williams' WHERE role='Business Intelligence Analyst'
UPDATE training_table SET name='Peter Griffin' WHERE id=28

select * from training_table

INSERT INTO training_table (name, role, salary) VALUES ('Michael Scott', 'Regional Manager', 75000);

SELECT
  role,
  COUNT(id) AS number_of_employees,
  CAST(AVG(salary) AS INTEGER) AS average_salary
FROM training_table
GROUP BY role
ORDER BY average_salary DESC;

UPDATE training_table
SET role = 'Senior Data Analyst', salary = 90000
WHERE name = 'John Sullivan';

DELETE FROM training_table
WHERE name = 'Marry Antoinette';

SELECT
  role,
  COUNT(id) as number_of_employees,
  CAST(AVG(salary) AS INTEGER) AS average_salary
FROM training_table
GROUP BY role
HAVING AVG(salary) > 100000;

UPDATE training_table SET role='Product Engineer' WHERE name='Sneha Reddy'