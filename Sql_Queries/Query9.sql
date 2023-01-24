SELECT fname, lname, phone_no, fac_id FROM customer
JOIN cust_uses_facilities
ON customer.cid = cust_uses_facilities.cid;

