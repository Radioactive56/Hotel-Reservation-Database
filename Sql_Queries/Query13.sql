SELECT CONCAT(fname,' ',lname) AS cust_name, pay_amt
FROM customer
JOIN payment
ON customer.cid = payment.cid
WHERE pay_amt > 
	(SELECT AVG(pay_amt) FROM payment);
