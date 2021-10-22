/*Answer 1*/
USE iSchool;
SELECT CONCAT(street, ', ',city) AS "Street/City", state AS State, zipcode AS Zipcode, country AS Country, RIGHT(main_phone, 4) AS "Last 4 Digits of Phone"
    FROM addresses
    ORDER BY state, country;
    
/*Answer 2*/
SELECT CONCAT(lname, ', ' , fname) AS person_name, start_date, department, 'Student' AS Student
	FROM people
    WHERE start_date > '2020-03-12' AND start_date < '2021-08-01' AND title IS NULL
    ORDER BY start_date DESC, person_name ASC;