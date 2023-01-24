SELECT fname, lname, pay_amt, pay_date FROM customer
JOIN payment
ON customer.cid = payment.cid
ORDER BY pay_amt DESC;


