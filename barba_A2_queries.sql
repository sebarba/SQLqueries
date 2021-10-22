/*Answer 1*/
SELECT CONCAT(lname,', ', fname) AS person_name, person_id, department, title, pronoun AS 'preferred pronouns', race AS 'race'
FROM people
	JOIN pronouns
		ON people.pronoun_id = pronouns.pronoun_id
	JOIN person_race
		USING(person_id)
	JOIN race
		USING(race_id)
WHERE title IS NOT NULL
UNION
SELECT CONCAT(lname,', ', fname) AS person_name, person_id, department, 'Student', pronoun AS 'preferred pronouns', race AS 'race'
FROM people
	JOIN pronouns
		ON people.pronoun_id = pronouns.pronoun_id
	JOIN person_race
		USING(person_id)
	JOIN race
		USING(race_id)
WHERE title IS NULL
ORDER BY department DESC, person_name;

/*Answer 2*/
SELECT CONCAT(course_code, course_number) AS 'course',
	CONCAT(semester, ' ', year, ' - ', section_number) AS 'section',
    CONCAT(fname, ' ', lname) AS 'student_name',
    course_description
FROM courses
JOIN course_sections USING(course_id)
LEFT JOIN enrollments USING(section_id)
LEFT JOIN people USING(person_id)
ORDER BY course DESC, year, section_number, lname;
