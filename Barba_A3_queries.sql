/*Answer 1*/
USE iSchool;
DROP TABLE IF EXISTS people_copy;
DROP TABLE IF EXISTS enrollments_copy;

CREATE TABLE people_copy LIKE people;
INSERT people_copy
SELECT *
FROM people;

CREATE TABLE enrollments_copy LIKE enrollments;
INSERT enrollments_copy
SELECT *
FROM enrollments;

INSERT INTO people_copy
	(lname, fname, pronoun_id, email, college, department, title, start_date)
VALUES 
	('Smith', 'Richard', '2', 'rsmith@umd.edu', 'College of Information Studies', 'BSIS', 'NULL', CURRENT_TIMESTAMP);
    
    
INSERT INTO enrollments_copy (person_id, section_id)
VALUES ('132466095', '1'), ('132466095', '46');

SELECT * 
FROM iSchool.enrollments_copy;

SELECT * 
FROM iSchool.people_copy;

/*ANSWER 2*/
SET SQL_SAFE_UPDATES = 0;
UPDATE enrollments_copy
SET section_id = 47
WHERE person_id = 132466095 AND section_id = 46;

SELECT CONCAT(fname, ' ', lname) AS student_name,
	CONCAT(course_code, course_number) AS course, 
	section_number, CONCAT(semester, ' ', year) AS 'semester_year'
FROM enrollments_copy
JOIN course_sections USING(section_id)
JOIN courses USING(course_id)
JOIN people_copy USING(person_id)
WHERE person_id = '132466095';

/*ANSWER 3*/
USE iSchool;
SELECT CONCAT(people.fname, ' ', people.lname) AS student_name,
	CONCAT(course_code, course_number) AS course, section_number, section_id, 
    CONCAT(i.fname, ' ', i.lname) AS instructor_name
FROM people
	JOIN enrollments USING(person_id)
    JOIN course_sections USING(section_id)
    JOIN courses USING(course_id)
    JOIN people i
		ON i.person_id = course_sections.instructor_id
WHERE course_code = 'INST' AND course_number = '327' ;

DELETE FROM enrollments
WHERE section_id IN (54,55,56,57,58,59,60,61);
