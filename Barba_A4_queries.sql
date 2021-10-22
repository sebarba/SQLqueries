/*Answer 1*/
USE iSchool;
SELECT CONCAT(fname, ' ', lname) AS student_name, SUM(credits) AS credit_count, COUNT(*) enrollments, TIME_FORMAT(MAX(start_time), "%h:%i:%s %p") AS latest_start
FROM people
JOIN enrollments USING(person_id)
JOIN course_sections USING(section_id)        
JOIN courses USING(course_id)
GROUP BY student_name WITH ROLLUP;

/*Answer 2*/
SELECT CONCAT(course_code, course_number) AS course, credits, COUNT(*) AS 'section_count', enrollment_count
FROM courses
	JOIN course_sections USING (course_id)
	LEFT JOIN (SELECT course_id, COUNT(*) AS 'enrollment_count' 
FROM people
	JOIN enrollments USING(person_id)
    JOIN course_sections USING(section_id)
    JOIN courses USING(course_id)
GROUP BY course_id) AS t USING(course_id)
GROUP BY course_id
ORDER BY enrollment_count DESC, course;

/*Bonus*/
/*I chose to use the subquery because I want to retrieve both the section 
and enrollment counts without affecting the other. It is helpful in organizing my table
while still being able to use JOINs. In my opinion, this is the most convenient 
to use in this problem.*/