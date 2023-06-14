create database student;

use student;

create table student_info(
  ID INT,
  Name VARCHAR(50),
  Age INT,
  Gender VARCHAR(10),
  Height VARCHAR(10),
  Weight VARCHAR(10),
  Score INT,
  Grade VARCHAR(2),
  City VARCHAR(50),
  Country VARCHAR(50)
);

INSERT INTO student_info(ID, Name, Age, Gender, Height, Weight, Score, Grade, City, Country) VALUES
  (1, 'John', 25, 'Male', '175cm', '70kg', 85, 'A', 'London', 'United Kingdom'),
  (2, 'Emily', 22, 'Female', '165cm', '55kg', 90, 'A', 'Paris', 'France'),
  (3, 'David', 30, 'Male', '180cm', '80kg', 70, 'C', 'Berlin', 'Germany'),
  (4, 'Sarah', 28, 'Female', '160cm', '50kg', 95, 'A+', 'New York', 'United States'),
  (5, 'Michael', 35, 'Male', '190cm', '90kg', 78, 'B+', 'Sydney', 'Australia'),
  (6, 'Emma', 20, 'Female', '155cm', '48kg', 88, 'A-', 'Toronto', 'Canada'),
  (7, 'James', 32, 'Male', '178cm', '75kg', 75, 'B', 'Tokyo', 'Japan'),
  (8, 'Olivia', 24, 'Female', '170cm', '60kg', 92, 'A', 'Rome', 'Italy'),
  (9, 'Daniel', 29, 'Male', '182cm', '85kg', 82, 'B+', 'Moscow', 'Russia'),
  (10, 'Sophia', 27, 'Female', '175cm', '58kg', 79, 'B', 'Beijing', 'China');
  
-- to show the table contents

select * from student_info;

-- 1. SELECT: Retrieve the names and ages of all students

SELECT Name, Age FROM student_info; 

-- 2. INSERT: Add a new student to the table:

INSERT INTO student_info(ID, Name, Age, Gender, Height, Weight, Score, Grade, City, Country)
VALUES (11, 'Liam', 23, 'Male', '180cm', '75kg', 88, 'A-', 'Los Angeles', 'United States');

-- 3. DISTINCT: Get unique values of grades from the table: 
 
SELECT DISTINCT Grade FROM student_info;

-- 4. WHERE: Retrieve students who are from the United Kingdom:

SELECT * FROM student_info WHERE Country = 'United Kingdom';

--  5. AND: Retrieve students who are females and have a score above 80:

SELECT * FROM student_info WHERE Gender = 'Female' AND Score > 80;

-- 6. OR: Retrieve students who are either from France or Germany: 

SELECT * FROM student_info WHERE Country = 'France' OR Country = 'Germany';

-- 7. NOT: Retrieve students who are not from the United States:

SELECT * FROM student_info WHERE NOT Country = 'United States';

-- 8. ORDER BY: Retrieve students sorted by their scores in descending order:

SELECT * FROM student_info ORDER BY Score DESC;

-- 9. NULL: Retrieve students who do not have a city specified:

SELECT * FROM student_info WHERE City IS NULL;

-- 9. NOT NULL: Retrieve students who have a city specified:

SELECT * FROM student_info WHERE City IS NOT NULL;

-- 10. UPDATE: Update the score of a specific student:

UPDATE student_info SET Score = 95 WHERE ID = 2;

--  11. DELETE: Delete a student from the table:

DELETE FROM student_info WHERE ID = 3;


-- 12. LIMIT: Retrieve only the first three rows from the table:

SELECT * FROM student_info LIMIT 3;

-- 13. COUNT: Count the number of students in the table:

SELECT COUNT(*) FROM student_info;

-- 14.  IN: Retrieve students from specific countries:

SELECT * FROM student_info WHERE Country IN ('United Kingdom', 'United States');

-- 15.  BETWEEN: Retrieve students with ages between 25 and 30:

SELECT * FROM student_info WHERE Age BETWEEN 25 AND 30;
