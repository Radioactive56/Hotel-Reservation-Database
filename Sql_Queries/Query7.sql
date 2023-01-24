SELECT cid, room_type, price FROM reservation
JOIN rooms
WHERE reservation.booking_id = rooms.booking_id
ORDER BY price ASC;
