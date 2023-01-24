-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.28 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hotel_reservation
CREATE DATABASE IF NOT EXISTS `hotel_reservation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel_reservation`;

-- Dumping structure for table hotel_reservation.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL DEFAULT '0',
  `lname` varchar(50) DEFAULT '0',
  `phone_no` varchar(15) NOT NULL DEFAULT '0',
  `house_no` int NOT NULL DEFAULT '0',
  `street` varchar(50) NOT NULL DEFAULT '0',
  `city` varchar(50) NOT NULL DEFAULT '0',
  `DOB` date NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.customer: ~8 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`cid`, `fname`, `lname`, `phone_no`, `house_no`, `street`, `city`, `DOB`) VALUES
	(1, 'Rahul', 'Seth', '9812567823', 102, 'Bandstand Promenade', 'Mumbai', '1994-04-03'),
	(2, 'Kailash', 'Narang', '8445320679', 304, 'Broadway', 'Chennai', '1992-05-21'),
	(3, 'Lila', 'Sachdev', '9125678340', 601, 'Lindsay', 'Kolkata', '1980-11-30'),
	(4, 'Haimi', 'Nath', '9234561180', 702, 'Kadapa Feeder', 'Amravati', '1973-08-25'),
	(5, 'Punit ', 'Mehan', '8124508526', 304, 'Mahatma Gandhi', 'Hyderabad', '1985-10-12'),
	(6, 'Sima', 'Pawar', '9045628143', 203, 'Kushabhau Thakre', 'Indore', '1998-12-09'),
	(7, 'Aishwarya', 'Tripathi', '9734570225', 402, 'Avenue ', 'Bangalore', '2001-03-13'),
	(8, 'Ranjit ', 'Din', '9876543210', 101, 'Ashok Marg', 'Lucknow', '1992-05-19'),
	(9, 'Samir ', 'Krishna', '9087645632', 504, 'Nai Sarak', 'Delhi', '1987-06-24'),
	(10, 'Akshay', 'Oza', '8452067921', 603, 'Marine Drive', 'Mumbai', '2002-09-29');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.cust_uses_facilities
CREATE TABLE IF NOT EXISTS `cust_uses_facilities` (
  `cid` int NOT NULL,
  `fac_id` varchar(10) NOT NULL DEFAULT '',
  `in_time` datetime NOT NULL,
  `out_time` datetime NOT NULL,
  PRIMARY KEY (`cid`,`fac_id`),
  KEY `FK2_cust-fac` (`fac_id`),
  CONSTRAINT `FK2_cust-fac` FOREIGN KEY (`fac_id`) REFERENCES `facilities` (`fac_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cust-fac` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.cust_uses_facilities: ~11 rows (approximately)
/*!40000 ALTER TABLE `cust_uses_facilities` DISABLE KEYS */;
INSERT INTO `cust_uses_facilities` (`cid`, `fac_id`, `in_time`, `out_time`) VALUES
	(1, 'SW003', '2022-01-17 20:34:56', '2022-01-17 21:35:43'),
	(4, 'SP002', '2022-02-22 16:00:06', '2022-02-22 17:00:10'),
	(5, 'GY001', '2022-03-22 19:20:20', '2022-03-22 20:30:10'),
	(5, 'SP002', '2022-03-23 15:00:02', '2022-03-23 16:00:16'),
	(5, 'SW003', '2022-03-24 17:05:43', '2022-03-24 18:10:44'),
	(7, 'SP002', '2022-03-28 14:00:09', '2022-03-28 15:00:56'),
	(8, 'GY001', '2022-04-02 07:00:00', '2022-04-02 08:00:08'),
	(8, 'SW003', '2022-04-02 18:00:52', '2022-04-02 19:03:25'),
	(9, 'SW003', '2022-04-02 10:00:15', '2022-04-02 11:10:23'),
	(10, 'GY001', '2022-04-04 08:10:00', '2022-04-04 09:15:31'),
	(10, 'SW003', '2022-04-05 15:00:34', '2022-04-05 16:15:19');
/*!40000 ALTER TABLE `cust_uses_facilities` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.department
CREATE TABLE IF NOT EXISTS `department` (
  `dep_id` varchar(10) NOT NULL DEFAULT '',
  `dep_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.department: ~8 rows (approximately)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dep_id`, `dep_name`) VALUES
	('d_01', 'Room_service'),
	('d_02', 'Front_office'),
	('d_03', 'Kitchen_dept'),
	('d_04', 'Maintenance'),
	('d_05', 'Security'),
	('d_06', 'Human_resource'),
	('d_07', 'Sales_marketing'),
	('d_08', 'IT');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `emp_name` varchar(50) NOT NULL DEFAULT '',
  `salary` int NOT NULL DEFAULT '0',
  `dep_id` varchar(10) NOT NULL DEFAULT '0',
  `designation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_employee_department` (`dep_id`),
  CONSTRAINT `FK_employee_department` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.employee: ~15 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`emp_id`, `emp_name`, `salary`, `dep_id`, `designation`) VALUES
	('AS191', 'Bhakti Verma', 200000, 'd_03', 'Asschef'),
	('AS192', 'Parvati Pramod', 200000, 'd_03', 'Asschef'),
	('CH190', 'Harish Rawal', 500000, 'd_03', 'Headchef'),
	('HR657', 'Shilpa Rao', 600000, 'd_06', 'HR'),
	('HR658', 'Dilip Joshi', 650000, 'd_06', 'HR'),
	('IT406', 'Manav D\'souza', 500000, 'd_08', 'Manager'),
	('MN508', 'Viral Oza', 100000, 'd_04', 'Electrician'),
	('MN509', 'Seema Patel', 120000, 'd_04', 'Technician'),
	('MS801', 'Naman Gawde', 300000, 'd_07', 'Executive'),
	('RC178', 'Aishwarya Sharma', 100000, 'd_02', 'Receptionist'),
	('RC179', 'Sahil Sawant', 150000, 'd_02', 'Receptionist'),
	('RS201', 'Ali Fazal', 150000, 'd_01', 'Attendant'),
	('RS202', 'Anvi Kashyap', 150000, 'd_01', 'Attendant'),
	('SC301', 'Bhushan Arora', 80000, 'd_05', 'Watchman'),
	('SC302', 'Yuvraj Rajput', 90000, 'd_05', 'Watchman');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.facilities
CREATE TABLE IF NOT EXISTS `facilities` (
  `fac_id` varchar(10) NOT NULL,
  `fac_name` varchar(20) NOT NULL,
  `fac_price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.facilities: ~3 rows (approximately)
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` (`fac_id`, `fac_name`, `fac_price`) VALUES
	('GY001', 'Gym', 2500),
	('SP002', 'SPA', 5000),
	('SW003', 'Swimming Pool', 3000);
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `pay_no` int NOT NULL,
  `pay_amt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_date` date NOT NULL,
  `cid` int NOT NULL,
  PRIMARY KEY (`cid`,`pay_no`),
  CONSTRAINT `FK__customer` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.payment: ~10 rows (approximately)
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`pay_no`, `pay_amt`, `pay_date`, `cid`) VALUES
	(1, 14000.00, '2022-01-02', 1),
	(1, 6500.00, '2022-01-15', 2),
	(1, 9500.00, '2022-02-03', 3),
	(1, 17000.00, '2022-02-10', 4),
	(2, 47500.00, '2022-03-09', 5),
	(1, 17000.00, '2022-03-11', 6),
	(2, 23000.00, '2022-03-20', 7),
	(2, 40000.00, '2022-03-24', 8),
	(1, 13500.00, '2022-03-24', 9),
	(3, 27000.00, '2022-03-25', 10);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `booking_id` varchar(10) NOT NULL,
  `booking_date` date NOT NULL,
  `No. of guests` int NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`),
  KEY `FK_cid` (`cid`),
  CONSTRAINT `FK_cid` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.reservation: ~10 rows (approximately)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` (`booking_id`, `booking_date`, `No. of guests`, `cid`) VALUES
	('22-0001', '2022-01-02', 4, 1),
	('22-0002', '2022-01-15', 2, 2),
	('22-0003', '2022-02-03', 3, 3),
	('22-0004', '2022-02-10', 4, 4),
	('22-0005', '2022-03-09', 6, 5),
	('22-0006', '2022-03-11', 3, 6),
	('22-0007', '2022-03-20', 5, 7),
	('22-0008', '2022-03-24', 6, 8),
	('22-0009', '2022-03-24', 3, 9),
	('22-0010', '2022-03-25', 5, 10);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.restaurant
CREATE TABLE IF NOT EXISTS `restaurant` (
  `bill_no` varchar(20) NOT NULL,
  `bill_amt` int NOT NULL DEFAULT '0',
  `table_no` int NOT NULL DEFAULT '0',
  `booking_id` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bill_no`),
  KEY `FK_book_id2` (`booking_id`),
  CONSTRAINT `FK_book_id2` FOREIGN KEY (`booking_id`) REFERENCES `reservation` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.restaurant: ~3 rows (approximately)
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` (`bill_no`, `bill_amt`, `table_no`, `booking_id`) VALUES
	('67415SAW639K62', 2000, 2, '22-0008'),
	('78699ADH353TY8', 3000, 7, '22-0005'),
	('90216FGD431BX9', 1500, 4, '22-0010');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;

-- Dumping structure for table hotel_reservation.rooms
CREATE TABLE IF NOT EXISTS `rooms` (
  `room_no` int NOT NULL,
  `room_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `price` int NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `booking_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`room_no`,`booking_id`),
  KEY `FK_bookid1` (`booking_id`),
  CONSTRAINT `FK_bookid1` FOREIGN KEY (`booking_id`) REFERENCES `reservation` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hotel_reservation.rooms: ~10 rows (approximately)
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`room_no`, `room_type`, `price`, `check_in`, `check_out`, `booking_id`) VALUES
	(201, 'Standard room', 2000, '2022-01-25 11:30:05', '2022-01-27 20:45:17', '22-0002'),
	(303, 'Triple room', 3000, '2022-04-01 20:10:19', '2022-04-03 19:28:01', '22-0009'),
	(304, 'Triple room', 3000, '2022-02-14 10:45:45', '2022-02-16 16:20:33', '22-0003'),
	(401, 'Quad room', 4000, '2022-02-20 12:45:02', '2022-02-23 14:05:48', '22-0004'),
	(402, 'Quad room', 4000, '2022-01-15 11:48:22', '2022-01-18 17:27:23', '22-0001'),
	(504, 'Deluxe room', 6000, '2022-03-22 12:15:42', '2022-03-24 18:26:20', '22-0006'),
	(601, 'Penthouse Suite', 8000, '2022-03-27 15:02:34', '2022-03-29 17:30:51', '22-0007'),
	(601, 'Penthouse Suite', 8000, '2022-04-03 09:24:09', '2022-04-06 16:50:49', '22-0010'),
	(702, 'Presidential Suite', 10000, '2022-03-21 21:00:34', '2022-03-25 10:04:28', '22-0005'),
	(703, 'Presidential Suite', 10000, '2022-04-01 14:40:15', '2022-04-04 17:29:36', '22-0008');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
backupuniversity