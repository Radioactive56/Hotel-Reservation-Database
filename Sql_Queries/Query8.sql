SELECT emp_name, dep_name, designation, salary FROM department
JOIN employee
ON department.dep_id = employee.dep_id
GROUP BY designation
ORDER BY salary DESC;
