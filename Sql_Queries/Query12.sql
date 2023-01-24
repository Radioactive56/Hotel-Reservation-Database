SELECT CONCAT(fname,' ',lname) AS cust_name, fac_name, fac_price
FROM customer 
INNER JOIN cust_uses_facilities
	ON customer.cid = cust_uses_facilities.cid
INNER JOIN facilities
	ON facilities.fac_id = cust_uses_facilities.fac_id
ORDER BY fac_price DESC;
