SELECT fname, lname, booking_date,
CASE
	WHEN booking_date BETWEEN '2022-01-01' AND '2022-01-31' THEN "New Year's Offer"
	ELSE 'No Offers'
END AS offers
FROM customer
JOIN reservation
ON customer.cid = reservation.cid;
