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

INSERT INTO authors (author_id, author_name) VALUES
(8, 'Stephen King'),
(9, 'Neil Gaiman'),
(10, 'Margaret Atwood'),
(11, 'Haruki Murakami'),
(12, 'Brandon Sanderson'),
(13, 'Philip K. Dick'),
(14, 'Toni Morrison'),
(15, 'Zadie Smith'),
(16, 'Agatha Christie');

-- Books for Stephen King (author_id: 8)
INSERT INTO books (title, author_id, genre) VALUES
('The Shining', 8, 'Horror'),
('It', 8, 'Horror'),
('The Stand', 8, 'Horror'),
('Misery', 8, 'Thriller'),
('Carrie', 8, 'Horror'),
('Pet Sematary', 8, 'Horror'),
('The Green Mile', 8, 'Fantasy'),
('11/22/63', 8, 'Science Fiction'),
('The Dark Tower I: The Gunslinger', 8, 'Fantasy'),
('The Dark Tower II: The Drawing of the Three', 8, 'Fantasy'),
('The Dark Tower III: The Waste Lands', 8, 'Fantasy'),
('The Dark Tower IV: Wizard and Glass', 8, 'Fantasy'),
('The Dark Tower V: Wolves of the Calla', 8, 'Fantasy'),
('The Dark Tower VI: Song of Susannah', 8, 'Fantasy'),
('The Dark Tower VII: The Dark Tower', 8, 'Fantasy'),
('Salem''s Lot', 8, 'Horror'),
('Different Seasons', 8, 'Drama'),
('On Writing: A Memoir of the Craft', 8, 'Non-Fiction'),
('The Institute', 8, 'Thriller'),
('Fairy Tale', 8, 'Fantasy'),
('Holly', 8, 'Mystery'),
('Cujo', 8, 'Horror'),
('Christine', 8, 'Horror'),
('The Dead Zone', 8, 'Thriller'),
('Firestarter', 8, 'Thriller'),
('Thinner', 8, 'Horror'),
('The Talisman', 8, 'Fantasy'),
('Black House', 8, 'Fantasy'),
('The Eyes of the Dragon', 8, 'Fantasy'),
('Needful Things', 8, 'Horror'),
('Gerald''s Game', 8, 'Thriller'),
('Dolores Claiborne', 8, 'Thriller'),
('Insomnia', 8, 'Fantasy'),
('Rose Madder', 8, 'Fantasy'),
('Desperation', 8, 'Horror'),
('The Regulators', 8, 'Horror'),
('Bag of Bones', 8, 'Horror'),
('Dreamcatcher', 8, 'Horror'),
('From a Buick 8', 8, 'Horror'),
('Cell', 8, 'Horror'),
('Lisey''s Story', 8, 'Fantasy'),
('Duma Key', 8, 'Horror'),
('Under the Dome', 8, 'Science Fiction'),
('Joyland', 8, 'Mystery'),
('Doctor Sleep', 8, 'Horror'),
('Mr. Mercedes', 8, 'Mystery'),
('Finders Keepers', 8, 'Mystery'),
('End of Watch', 8, 'Mystery'),
('The Outsider', 8, 'Horror'),
('Elevation', 8, 'Fantasy'),
('Later', 8, 'Thriller'),
('Billy Summers', 8, 'Thriller');

-- Books for Agatha Christie (author_id: 16)
INSERT INTO books (title, author_id, genre) VALUES
('The Mysterious Affair at Styles', 16, 'Mystery'),
('The Secret Adversary', 16, 'Mystery'),
('The Murder on the Links', 16, 'Mystery'),
('The Man in the Brown Suit', 16, 'Mystery'),
('The Secret of Chimneys', 16, 'Mystery'),
('The Murder of Roger Ackroyd', 16, 'Mystery'),
('The Big Four', 16, 'Mystery'),
('The Mystery of the Blue Train', 16, 'Mystery'),
('The Seven Dials Mystery', 16, 'Mystery'),
('The Murder at the Vicarage', 16, 'Mystery'),
('The Sittaford Mystery', 16, 'Mystery'),
('Peril at End House', 16, 'Mystery'),
('Lord Edgware Dies', 16, 'Mystery'),
('Murder on the Orient Express', 16, 'Mystery'),
('Why Didn''t They Ask Evans?', 16, 'Mystery'),
('Three Act Tragedy', 16, 'Mystery'),
('Death in the Clouds', 16, 'Mystery'),
('The A.B.C. Murders', 16, 'Mystery'),
('Murder in Mesopotamia', 16, 'Mystery'),
('Cards on the Table', 16, 'Mystery'),
('Dumb Witness', 16, 'Mystery'),
('Death on the Nile', 16, 'Mystery'),
('Appointment with Death', 16, 'Mystery'),
('Hercule Poirot''s Christmas', 16, 'Mystery'),
('Murder is Easy', 16, 'Mystery'),
('And Then There Were None', 16, 'Mystery'),
('Sad Cypress', 16, 'Mystery'),
('One, Two, Buckle My Shoe', 16, 'Mystery'),
('Evil Under the Sun', 16, 'Mystery'),
('N or M?', 16, 'Mystery'),
('The Body in the Library', 16, 'Mystery'),
('Five Little Pigs', 16, 'Mystery'),
('The Moving Finger', 16, 'Mystery'),
('Towards Zero', 16, 'Mystery'),
('Death Comes as the End', 16, 'Mystery'),
('Sparkling Cyanide', 16, 'Mystery'),
('The Hollow', 16, 'Mystery'),
('Taken at the Flood', 16, 'Mystery'),
('Crooked House', 16, 'Mystery'),
('A Murder is Announced', 16, 'Mystery'),
('They Came to Baghdad', 16, 'Mystery'),
('Mrs McGinty''s Dead', 16, 'Mystery'),
('They Do It with Mirrors', 16, 'Mystery'),
('After the Funeral', 16, 'Mystery'),
('A Pocket Full of Rye', 16, 'Mystery'),
('Destination Unknown', 16, 'Mystery'),
('Hickory Dickory Dock', 16, 'Mystery'),
('Dead Man''s Folly', 16, 'Mystery'),
('4.50 from Paddington', 16, 'Mystery'),
('Ordeal by Innocence', 16, 'Mystery'),
('Cat Among the Pigeons', 16, 'Mystery'),
('The Pale Horse', 16, 'Mystery'),
('The Mirror Crack''d from Side to Side', 16, 'Mystery'),
('The Clocks', 16, 'Mystery'),
('A Caribbean Mystery', 16, 'Mystery'),
('At Bertram''s Hotel', 16, 'Mystery'),
('Third Girl', 16, 'Mystery'),
('Endless Night', 16, 'Mystery'),
('By the Pricking of My Thumbs', 16, 'Mystery'),
('Hallowe''en Party', 16, 'Mystery'),
('Passenger to Frankfurt', 16, 'Mystery'),
('Nemesis', 16, 'Mystery'),
('Elephants Can Remember', 16, 'Mystery'),
('Postern of Fate', 16, 'Mystery'),
('Curtain: Poirot''s Last Case', 16, 'Mystery'),
('Sleeping Murder', 16, 'Mystery');

-- Books for Neil Gaiman (author_id: 9)
INSERT INTO books (title, author_id, genre) VALUES
('American Gods', 9, 'Fantasy'),
('The Ocean at the End of the Lane', 9, 'Fantasy'),
('Stardust', 9, 'Fantasy'),
('Coraline', 9, 'Horror'),
('The Graveyard Book', 9, 'Fantasy'),
('Neverwhere', 9, 'Fantasy'),
('Good Omens', 9, 'Fantasy'),
('Anansi Boys', 9, 'Fantasy'),
('Norse Mythology', 9, 'Mythology'),
('Fragile Things', 9, 'Short Stories'),
('Smoke and Mirrors', 9, 'Short Stories'),
('The Sandman, Vol. 1: Preludes & Nocturnes', 9, 'Comics'),
('The Sandman, Vol. 2: The Doll''s House', 9, 'Comics'),
('The Sandman, Vol. 3: Dream Country', 9, 'Comics'),
('The Books of Magic', 9, 'Comics'),
('Fortunately, the Milk', 9, 'Childrens'),
('The Day I Swapped My Dad for Two Goldfish', 9, 'Childrens');

-- Books for Margaret Atwood (author_id: 10)
INSERT INTO books (title, author_id, genre) VALUES
('The Handmaid''s Tale', 10, 'Dystopian'),
('The Testaments', 10, 'Dystopian'),
('Oryx and Crake', 10, 'Science Fiction'),
('The Year of the Flood', 10, 'Science Fiction'),
('MaddAddam', 10, 'Science Fiction'),
('Alias Grace', 10, 'Historical Fiction'),
('The Blind Assassin', 10, 'Historical Fiction'),
('Cat''s Eye', 10, 'Contemporary'),
('Surfacing', 10, 'Contemporary'),
('The Penelopiad', 10, 'Mythology'),
('The Robber Bride', 10, 'Contemporary'),
('Stone Mattress', 10, 'Short Stories'),
('The Edible Woman', 10, 'Contemporary'),
('Lady Oracle', 10, 'Contemporary'),
('Life Before Man', 10, 'Contemporary'),
('Bodily Harm', 10, 'Contemporary'),
('The Heart Goes Last', 10, 'Dystopian'),
('Hag-Seed', 10, 'Contemporary');

-- Books for Haruki Murakami (author_id: 11)
INSERT INTO books (title, author_id, genre) VALUES
('Norwegian Wood', 11, 'Contemporary'),
('Kafka on the Shore', 11, 'Magical Realism'),
('1Q84', 11, 'Magical Realism'),
('The Wind-Up Bird Chronicle', 11, 'Magical Realism'),
('Sputnik Sweetheart', 11, 'Contemporary'),
('Hard-Boiled Wonderland and the End of the World', 11, 'Science Fiction'),
('After Dark', 11, 'Contemporary'),
('Colorless Tsukuru Tazaki and His Years of Pilgrimage', 11, 'Contemporary'),
('Killing Commendatore', 11, 'Magical Realism'),
('A Wild Sheep Chase', 11, 'Magical Realism'),
('Dance Dance Dance', 11, 'Magical Realism'),
('South of the Border, West of the Sun', 11, 'Contemporary'),
('The Elephant Vanishes', 11, 'Short Stories'),
('After the Quake', 11, 'Short Stories'),
('Blind Willow, Sleeping Woman', 11, 'Short Stories'),
('Men Without Women', 11, 'Short Stories'),
('First Person Singular', 11, 'Short Stories');

-- Books for Brandon Sanderson (author_id: 12)
INSERT INTO books (title, author_id, genre) VALUES
('Mistborn: The Final Empire', 12, 'Fantasy'),
('The Well of Ascension', 12, 'Fantasy'),
('The Hero of Ages', 12, 'Fantasy'),
('The Alloy of Law', 12, 'Fantasy'),
('Shadows of Self', 12, 'Fantasy'),
('The Bands of Mourning', 12, 'Fantasy'),
('The Lost Metal', 12, 'Fantasy'),
('The Way of Kings', 12, 'Fantasy'),
('Words of Radiance', 12, 'Fantasy'),
('Oathbringer', 12, 'Fantasy'),
('Rhythm of War', 12, 'Fantasy'),
('Warbreaker', 12, 'Fantasy'),
('Elantris', 12, 'Fantasy'),
('Tress of the Emerald Sea', 12, 'Fantasy'),
('Yumi and the Nightmare Painter', 12, 'Fantasy'),
('The Sunlit Man', 12, 'Fantasy'),
('Skyward', 12, 'Science Fiction'),
('Starsight', 12, 'Science Fiction'),
('Cytonic', 12, 'Science Fiction'),
('Defiant', 12, 'Science Fiction'),
('Steelheart', 12, 'Young Adult'),
('Firefight', 12, 'Young Adult'),
('Calamity', 12, 'Young Adult'),
('The Rithmatist', 12, 'Young Adult');

-- Books for Philip K. Dick (author_id: 13)
INSERT INTO books (title, author_id, genre) VALUES
('Do Androids Dream of Electric Sheep?', 13, 'Science Fiction'),
('Ubik', 13, 'Science Fiction'),
('A Scanner Darkly', 13, 'Science Fiction'),
('The Man in the High Castle', 13, 'Science Fiction'),
('VALIS', 13, 'Science Fiction'),
('The Three Stigmata of Palmer Eldritch', 13, 'Science Fiction'),
('Flow My Tears, the Policeman Said', 13, 'Science Fiction'),
('A Maze of Death', 13, 'Science Fiction'),
('Now Wait for Last Year', 13, 'Science Fiction'),
('Dr. Bloodmoney', 13, 'Science Fiction'),
('The Penultimate Truth', 13, 'Science Fiction'),
('The Simulacra', 13, 'Science Fiction'),
('Clans of the Alphane Moon', 13, 'Science Fiction'),
('Martian Time-Slip', 13, 'Science Fiction');

-- Books for Toni Morrison (author_id: 14)
INSERT INTO books (title, author_id, genre) VALUES
('Beloved', 14, 'Historical Fiction'),
('The Bluest Eye', 14, 'Contemporary'),
('Song of Solomon', 14, 'Contemporary'),
('Sula', 14, 'Contemporary'),
('Jazz', 14, 'Historical Fiction'),
('Paradise', 14, 'Contemporary'),
('A Mercy', 14, 'Historical Fiction'),
('Home', 14, 'Contemporary'),
('God Help the Child', 14, 'Contemporary'),
('Tar Baby', 14, 'Contemporary');

-- Books for Zadie Smith (author_id: 15)
INSERT INTO books (title, author_id, genre) VALUES
('White Teeth', 15, 'Contemporary'),
('On Beauty', 15, 'Contemporary'),
('Swing Time', 15, 'Contemporary'),
('NW', 15, 'Contemporary'),
('The Autograph Man', 15, 'Contemporary'),
('Grand Union', 15, 'Short Stories'),
('The Fraud', 15, 'Historical Fiction'),
('Feel Free', 15, 'Non-Fiction'),
('Intimations', 15, 'Non-Fiction');

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