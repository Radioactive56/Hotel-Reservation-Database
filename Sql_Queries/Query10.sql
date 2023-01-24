SELECT fname, lname, pay_no,
CASE
	WHEN pay_no = 1 THEN 'New'
	WHEN pay_no = 2 THEN 'Familiar'
	WHEN pay_no > 2 THEN 'Regular'
END AS customer_type
FROM customer
JOIN payment
ON customer.cid = payment.cid;
