SELECT fname, lname, DOB, year(CURDATE())-year(DOB) AS age 
FROM customer;
