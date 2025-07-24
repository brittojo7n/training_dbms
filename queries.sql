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

SELECT DISTINCT * FROM training_table

INSERT INTO training_table(name,role,salary) VALUES( 'Peter Griffin','Social Service','69000')

SELECT DISTINCT name FROM training_table ORDER BY name;

SELECT DISTINCT role FROM training_table ORDER BY role;

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

INSERT INTO authors (author_name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

INSERT INTO books (title, author_id) VALUES
('Harry Potter and the Sorcerer''s Stone', 1),
('A Game of Thrones', 2),
('The Hobbit', 3); 

SELECT * FROM books JOIN authors ON books.author_id = authors.author_id;

INSERT INTO books (title, author_id) VALUES
('Harry Potter and the Chamber of Secrets', 1),
('A Clash of Kings', 2),
('The Fellowship of the Ring', 3),
('Harry Potter and the Prisoner of Azkaban', 1),
('The Lord of the Rings', 3);

SELECT * FROM books b JOIN authors a ON b.author_id = a.author_id;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'processing'
);

INSERT INTO customers (name, email, join_date) VALUES
('John Smith', 'john@example.com', '2023-01-15'),
('Sarah Johnson', 'sarah@example.com', '2023-02-20'),
('Mike Brown', 'mike@example.com', '2023-03-10'),
('Emily Davis', 'emily@example.com', '2023-01-05');

INSERT INTO orders (customer_id, order_date, amount, status) VALUES
(1, '2023-04-01', 150.00, 'completed'),
(1, '2023-04-15', 75.50, 'completed'),
(2, '2023-04-05', 200.00, 'completed'),
(3, '2023-04-10', 50.00, 'cancelled'),
(1, '2023-05-02', 125.00, 'processing'),
(4, '2023-05-01', 300.00, 'completed');

SELECT * FROM customers;
SELECT * FROM orders;

WITH customer_totals AS (
    SELECT 
        customer_id,
        SUM(amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) SELECT 
    c.name,
    c.email,
    ct.total_spent
FROM customers c
JOIN customer_totals ct ON c.customer_id = ct.customer_id
ORDER BY ct.total_spent DESC;

CREATE TABLE courses (
    department VARCHAR(4),
    course_number INT,
    title VARCHAR(100),
    credits INT,
    PRIMARY KEY (department, course_number)
);

CREATE TABLE enrollments (
    student_id INT,
    department VARCHAR(4),
    course_number INT,
    semester VARCHAR(20),
    grade CHAR(2),
    PRIMARY KEY (student_id, department, course_number, semester),
    FOREIGN KEY (department, course_number) REFERENCES courses(department, course_number)
);

INSERT INTO courses VALUES 
('MATH', 101, 'Calculus I', 4),
('MATH', 102, 'Calculus II', 4),
('CS', 101, 'Intro to Programming', 3),
('CS', 201, 'Data Structures', 3),
('PHYS', 101, 'Physics I', 4);

INSERT INTO enrollments VALUES
(1001, 'MATH', 101, 'Fall 2023', 'A'),
(1001, 'CS', 101, 'Fall 2023', 'B+'),
(1002, 'MATH', 101, 'Fall 2023', 'B'),
(1002, 'PHYS', 101, 'Fall 2023', 'A'),
(1001, 'MATH', 102, 'Spring 2024', 'A-'),
(1001, 'CS', 201, 'Spring 2024', NULL),
(1003, 'CS', 101, 'Spring 2024', NULL);

SELECT * FROM courses;
SELECT * FROM enrollments;

SELECT e.student_id, e.grade
FROM enrollments e
WHERE e.department = 'MATH'
AND e.course_number = 101;

SELECT * FROM enrollments e
WHERE e.department = 'MATH'
AND e.course_number = 102;

SELECT *
FROM courses
WHERE department = 'CS'
AND course_number = 101;

ALTER TABLE courses
ADD COLUMN subject_id VARCHAR(5) 
DEFAULT 'C4D6E'
CHECK (subject_id IS NOT NULL);

ALTER TABLE courses
ALTER COLUMN subject_id DROP DEFAULT;

INSERT INTO courses(department, course_number, title, credits, subject_id) 
VALUES('CS', '110', 'HV&E', '3', '   ');

SELECT * FROM courses;

SELECT role, COUNT(name) AS NUM_OF_PEOPLE 
FROM training_table 
WHERE role != 'Business Analyst' 
GROUP BY role HAVING COUNT(name) > 1;

SELECT AVG(salary) AS average_salary FROM training_table;

SELECT
  MIN(salary) AS lowest_salary,
  MAX(salary) AS highest_salary
FROM training_table;

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM customers c JOIN orders o ON c.customer_id = o.customer_id;

SELECT name, AVG(amount) 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY name;

SELECT * FROM authors;
SELECT * FROM books;

ALTER TABLE books ADD COLUMN genre VARCHAR(20);

UPDATE books SET genre = 'Fantasy' WHERE title = 'Harry Potter and the Sorcerer''s Stone';

UPDATE books
SET genre = 'Fantasy'
WHERE author_id IN (
    SELECT author_id FROM authors WHERE author_name IN (
        'J.K. Rowling',
        'George R.R. Martin',
        'J.R.R. Tolkien'
    )
);

INSERT INTO authors (author_name) VALUES
('Frank Herbert'),
('Agatha Christie'),
('Jane Austen'),
('Isaac Asimov');

INSERT INTO books (title, author_id, genre) VALUES
('Dune', 4, 'Science Fiction'),
('And Then There Were None', 5, 'Mystery'),
('Pride and Prejudice', 6, 'Classic'),
('Foundation', 7, 'Science Fiction'),
('Murder on the Orient Express', 5, 'Mystery');

SELECT b.title, a.author_name, b.genre
FROM books b JOIN authors a ON b.author_id = a.author_id
ORDER BY a.author_name, b.title;

SELECT author_name, genre, COUNT(title) 
FROM authors 
JOIN books ON authors.author_id = books.author_id 
GROUP BY genre, author_name
ORDER BY author_name, genre;

SELECT author_name, genre, COUNT(title) AS NUM_OF_BOOKS 
FROM books b 
JOIN authors a ON b.author_id = a.author_id 
WHERE genre = 'Fantasy'
GROUP BY author_name, genre
HAVING COUNT(title) > 2
ORDER BY author_name, genre;

WITH BooksCount AS (
    SELECT author_name, COUNT(book_id) AS num_of_books
    FROM authors a
    JOIN books b ON a.author_id = b.author_id
    GROUP BY author_name
)
SELECT AVG(num_of_books) AS avg_num_of_books
FROM BooksCount;

INSERT INTO books (title, author_id, genre) 
VALUES('Harry Potter and the Goblet of Fire', 1, 'Fantasy')

WITH BookCounts AS (
    SELECT author_id, COUNT(book_id) AS book_count
    FROM books
    GROUP BY author_id
)
SELECT MAX(book_count) FROM BookCounts;

WITH BookCounts AS (
    SELECT author_id, COUNT(book_id) AS book_count
    FROM books
    GROUP BY author_id
)
SELECT MIN(book_count) FROM BookCounts;

WITH BookCounts AS (
    SELECT author_id, COUNT(book_id) AS book_count
    FROM books
    GROUP BY author_id
)
SELECT a.author_name, b.title, b.genre
FROM authors a
JOIN books b ON a.author_id = b.author_id
WHERE a.author_id IN (
    SELECT author_id FROM BookCounts WHERE book_count = (SELECT MAX(book_count) FROM BookCounts)
)
ORDER BY b.title;

WITH BookCounts AS (
    SELECT author_id, COUNT(book_id) AS book_count
    FROM books
    GROUP BY author_id
)
SELECT author_name, title, genre FROM authors a
JOIN books b ON a.author_id = b.author_id
WHERE a.author_id IN (
    SELECT author_id 
    FROM BookCounts 
    WHERE book_count = (
        SELECT MIN(book_count) 
        FROM BookCounts
    )
)
ORDER BY b.title;
