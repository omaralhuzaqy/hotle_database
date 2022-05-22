-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2021 at 09:29 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotle`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `customer_information`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_information` (IN `customer_name` VARCHAR(200))  SELECT customer.ID, customer.F_NAME,customer.L_NAME,customer_phone.PHONE,customer.CITY
FROM customer INNER JOIN customer_phone
on customer.ID=customer_phone.customer_ID
WHERE customer.F_NAME=customer_name$$

DROP PROCEDURE IF EXISTS `employee_information`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_information` (IN `employee_name` VARCHAR(200))  SELECT employee.ID, employee.F_NAME,employee.L_NAME,employee_phone.PHONE,employee.JOB_TITLE,
employee.NATIONALITY,employee.SALARY 
FROM employee INNER JOIN employee_phone 
on employee.ID=employee_phone.EMPLOYEE_ID
WHERE employee.F_NAME=employee_name$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `accountant_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `accountant_information`;
CREATE TABLE IF NOT EXISTS `accountant_information` (
`AVG(employee.SALARY)` decimal(14,4)
,`SUM(employee.SALARY)` decimal(32,0)
,`AVG(reservation.PRICE)` decimal(14,4)
,`SUM(reservation.PRICE)` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `count_employee_reservation__information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `count_employee_reservation__information`;
CREATE TABLE IF NOT EXISTS `count_employee_reservation__information` (
`employee_ID` int(11)
,`count(reservation.ID)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `ID` int(11) NOT NULL,
  `NAME_HOTLE` varchar(200) NOT NULL DEFAULT 'ROZE',
  `B_DATE` date NOT NULL,
  `NATIONALITY` varchar(300) NOT NULL,
  `F_NAME` varchar(200) NOT NULL,
  `L_NAME` varchar(200) NOT NULL,
  `CITY` varchar(200) NOT NULL,
  `STREET` varchar(200) DEFAULT NULL,
  `BUILDING_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_FK1` (`NAME_HOTLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `NAME_HOTLE`, `B_DATE`, `NATIONALITY`, `F_NAME`, `L_NAME`, `CITY`, `STREET`, `BUILDING_NUMBER`) VALUES
(11, 'Roze', '1990-05-01', 'jordanian', 'OMAR', 'mahmoud', 'amman', 'Amman street', 3),
(12, 'Roze', '1982-05-22', 'Saudi', 'ahmad', 'mahmoud', 'Mecca', NULL, NULL),
(13, 'Roze', '1972-12-01', 'Egyptian', 'yaser', 'mahmoud', 'Cairo', 'Cairo street', NULL),
(15, 'Roze', '1997-11-11', 'jordanian', 'farah', 'ahamad', 'Amman', NULL, NULL),
(112, 'Roze', '1989-11-01', 'jordanian', 'KAMEL', 'ALHUZAQI', 'AMMAN', 'ZAIN street', 3),
(113, 'Roze', '1999-01-02', 'Egyptian', 'ALAA', 'KAMEL', 'CAIRO', 'CAIRO street', 8),
(114, 'Roze', '1985-12-04', 'Egyptian', 'MAYA', 'AWAD', 'SHARM', NULL, NULL),
(117, 'Roze', '1990-03-07', 'jordanian', 'LAYTH', 'KANAAN', 'KARK', 'ROMI street', 13);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `customer_information`;
CREATE TABLE IF NOT EXISTS `customer_information` (
`ID` int(11)
,`F_NAME` varchar(200)
,`L_NAME` varchar(200)
,`PHONE` int(11)
,`CITY` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

DROP TABLE IF EXISTS `customer_phone`;
CREATE TABLE IF NOT EXISTS `customer_phone` (
  `customer_ID` int(11) NOT NULL,
  `PHONE` int(11) NOT NULL,
  PRIMARY KEY (`customer_ID`,`PHONE`),
  UNIQUE KEY `PHONE` (`PHONE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`customer_ID`, `PHONE`) VALUES
(12, 799474514),
(13, 797213529),
(15, 787545221),
(112, 77745455),
(112, 654215145),
(113, 79756849),
(114, 77747879),
(117, 79745457);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ID` int(11) NOT NULL,
  `NAME_HOTLE` varchar(200) NOT NULL DEFAULT 'ROZE',
  `B_DATE` date NOT NULL,
  `SALARY` int(11) NOT NULL,
  `JOB_TITLE` varchar(600) NOT NULL,
  `NATIONALITY` varchar(300) NOT NULL,
  `F_NAME` varchar(200) NOT NULL,
  `L_NAME` varchar(200) NOT NULL,
  `CITY` varchar(200) NOT NULL,
  `STREET` varchar(200) NOT NULL,
  `BUILDING_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `EMPLOYEE_FK1` (`NAME_HOTLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `NAME_HOTLE`, `B_DATE`, `SALARY`, `JOB_TITLE`, `NATIONALITY`, `F_NAME`, `L_NAME`, `CITY`, `STREET`, `BUILDING_NUMBER`) VALUES
(107, 'Roze', '1990-03-07', 900, 'LEADER', 'jordanian', 'LINA', 'HAMMAD', 'amman', 'JORDAN street', 13),
(115, 'Roze', '2002-05-01', 800, 'Receptionist', 'jordanian', 'OMAR', 'ALHUZAQI', 'amman', 'aladwan street', 3),
(120, 'Roze', '1999-01-02', 500, 'Room service', 'Syrian', 'ALAA', 'KAMEL', 'amman', 'ALGARDENZ street', 8),
(121, 'Roze', '0199-08-01', 800, 'Accountant', 'jordanian', 'Raad', 'Kanan', 'amman', 'algardeanz street', 113);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employee_information`;
CREATE TABLE IF NOT EXISTS `employee_information` (
`ID` int(11)
,`F_NAME` varchar(200)
,`L_NAME` varchar(200)
,`PHONE` int(11)
,`JOB_TITLE` varchar(600)
,`NATIONALITY` varchar(300)
,`SALARY` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee_phone`
--

DROP TABLE IF EXISTS `employee_phone`;
CREATE TABLE IF NOT EXISTS `employee_phone` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `PHONE` int(11) NOT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`PHONE`),
  UNIQUE KEY `PHONE` (`PHONE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_phone`
--

INSERT INTO `employee_phone` (`EMPLOYEE_ID`, `PHONE`) VALUES
(107, 777273527),
(107, 797813549),
(115, 772154895),
(115, 797213529),
(120, 797257829);

-- --------------------------------------------------------

--
-- Table structure for table `hotle`
--

DROP TABLE IF EXISTS `hotle`;
CREATE TABLE IF NOT EXISTS `hotle` (
  `NAME` varchar(200) NOT NULL,
  `CITY` varchar(300) NOT NULL DEFAULT 'AMMAN',
  `STREET` varchar(350) NOT NULL DEFAULT 'JORDAN STREET',
  `BUILDING_NUMBER` int(11) NOT NULL DEFAULT '12',
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotle`
--

INSERT INTO `hotle` (`NAME`, `CITY`, `STREET`, `BUILDING_NUMBER`) VALUES
('ROZE', 'AMMAN', 'JORDAN STREET', 12);

-- --------------------------------------------------------

--
-- Stand-in structure for view `hotle_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `hotle_information`;
CREATE TABLE IF NOT EXISTS `hotle_information` (
`NAME` varchar(200)
,`CITY` varchar(300)
,`STREET` varchar(350)
,`BUILDING_NUMBER` int(11)
,`PHONE` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `hotle_phone`
--

DROP TABLE IF EXISTS `hotle_phone`;
CREATE TABLE IF NOT EXISTS `hotle_phone` (
  `NAME_HOTLE` varchar(200) NOT NULL,
  `PHONE` int(11) NOT NULL,
  PRIMARY KEY (`NAME_HOTLE`,`PHONE`),
  UNIQUE KEY `PHONE` (`PHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotle_phone`
--

INSERT INTO `hotle_phone` (`NAME_HOTLE`, `PHONE`) VALUES
('ROZE', 654215),
('ROZE', 777454);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `ID` int(11) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `employee_ID` int(11) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `BOOKING_DATE` date NOT NULL,
  `BOOKING_PERIOD` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_FK1` (`customer_ID`),
  KEY `employee_FK1` (`employee_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ID`, `customer_ID`, `employee_ID`, `PRICE`, `BOOKING_DATE`, `BOOKING_PERIOD`) VALUES
(2002, 112, 107, 350, '2021-02-22', '2021-02-25'),
(2010, 113, 107, 1200, '2021-05-11', '2021-05-18'),
(2022, 11, 115, 550, '2021-07-21', '2021-07-25'),
(2023, 12, 120, 550, '2021-07-21', '2021-07-25'),
(2024, 13, 115, 450, '2021-07-21', '2021-07-24'),
(2025, 117, 120, 350, '2021-07-22', '2021-07-25'),
(2026, 15, 120, 950, '2021-07-22', '2021-07-29');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservation_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reservation_information`;
CREATE TABLE IF NOT EXISTS `reservation_information` (
`F_NAME` varchar(200)
,`L_NAME` varchar(200)
,`ID` int(11)
,`BOOKING_DATE` date
,`BOOKING_PERIOD` date
,`PRICE` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservation_room`
--

DROP TABLE IF EXISTS `reservation_room`;
CREATE TABLE IF NOT EXISTS `reservation_room` (
  `reservation_ID` int(11) NOT NULL,
  `room_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`reservation_ID`,`room_NUMBER`),
  KEY `RESERVATION_ROOM_FK2` (`room_NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation_room`
--

INSERT INTO `reservation_room` (`reservation_ID`, `room_NUMBER`) VALUES
(2002, 11),
(2010, 12),
(2022, 13),
(2023, 25),
(2024, 26),
(2025, 27),
(2026, 28);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `ROOM_NUMBER` int(11) NOT NULL,
  `NAME_HOTLE` varchar(200) NOT NULL DEFAULT 'ROZE',
  `ROOM_TYPE` varchar(200) NOT NULL,
  PRIMARY KEY (`ROOM_NUMBER`),
  KEY `ROOM_FK1` (`NAME_HOTLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOM_NUMBER`, `NAME_HOTLE`, `ROOM_TYPE`) VALUES
(11, 'ROZE', 'single'),
(12, 'ROZE', 'single'),
(13, 'ROZE', 'single'),
(25, 'ROZE', 'douple'),
(26, 'ROZE', 'douple'),
(27, 'ROZE', 'douple'),
(28, 'ROZE', 'douple');

-- --------------------------------------------------------

--
-- Stand-in structure for view `room_information`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `room_information`;
CREATE TABLE IF NOT EXISTS `room_information` (
`ROOM_NUMBER` int(11)
,`ROOM_TYPE` varchar(200)
,`reservation_ID` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `accountant_information`
--
DROP TABLE IF EXISTS `accountant_information`;

DROP VIEW IF EXISTS `accountant_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `accountant_information`  AS  select avg(`employee`.`SALARY`) AS `AVG(employee.SALARY)`,sum(`employee`.`SALARY`) AS `SUM(employee.SALARY)`,avg(`reservation`.`PRICE`) AS `AVG(reservation.PRICE)`,sum(`reservation`.`PRICE`) AS `SUM(reservation.PRICE)` from (`employee` join `reservation` on((`employee`.`ID` = `reservation`.`employee_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `count_employee_reservation__information`
--
DROP TABLE IF EXISTS `count_employee_reservation__information`;

DROP VIEW IF EXISTS `count_employee_reservation__information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_employee_reservation__information`  AS  select `reservation`.`employee_ID` AS `employee_ID`,count(`reservation`.`ID`) AS `count(reservation.ID)` from `reservation` group by `reservation`.`employee_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `customer_information`
--
DROP TABLE IF EXISTS `customer_information`;

DROP VIEW IF EXISTS `customer_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_information`  AS  select `customer`.`ID` AS `ID`,`customer`.`F_NAME` AS `F_NAME`,`customer`.`L_NAME` AS `L_NAME`,`customer_phone`.`PHONE` AS `PHONE`,`customer`.`CITY` AS `CITY` from (`customer` join `customer_phone` on((`customer`.`ID` = `customer_phone`.`customer_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `employee_information`
--
DROP TABLE IF EXISTS `employee_information`;

DROP VIEW IF EXISTS `employee_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_information`  AS  select `employee`.`ID` AS `ID`,`employee`.`F_NAME` AS `F_NAME`,`employee`.`L_NAME` AS `L_NAME`,`employee_phone`.`PHONE` AS `PHONE`,`employee`.`JOB_TITLE` AS `JOB_TITLE`,`employee`.`NATIONALITY` AS `NATIONALITY`,`employee`.`SALARY` AS `SALARY` from (`employee` join `employee_phone` on((`employee`.`ID` = `employee_phone`.`EMPLOYEE_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `hotle_information`
--
DROP TABLE IF EXISTS `hotle_information`;

DROP VIEW IF EXISTS `hotle_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hotle_information`  AS  select `NAME` AS `NAME`,`CITY` AS `CITY`,`STREET` AS `STREET`,`BUILDING_NUMBER` AS `BUILDING_NUMBER`,`hotle_phone`.`PHONE` AS `PHONE` from (`hotle` join `hotle_phone` on((`NAME` = `hotle_phone`.`NAME_HOTLE`))) ;

-- --------------------------------------------------------

--
-- Structure for view `reservation_information`
--
DROP TABLE IF EXISTS `reservation_information`;

DROP VIEW IF EXISTS `reservation_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservation_information`  AS  select `customer`.`F_NAME` AS `F_NAME`,`customer`.`L_NAME` AS `L_NAME`,`reservation`.`ID` AS `ID`,`reservation`.`BOOKING_DATE` AS `BOOKING_DATE`,`reservation`.`BOOKING_PERIOD` AS `BOOKING_PERIOD`,`reservation`.`PRICE` AS `PRICE` from (`customer` join `reservation` on((`customer`.`ID` = `reservation`.`customer_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `room_information`
--
DROP TABLE IF EXISTS `room_information`;

DROP VIEW IF EXISTS `room_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `room_information`  AS  select `room`.`ROOM_NUMBER` AS `ROOM_NUMBER`,`room`.`ROOM_TYPE` AS `ROOM_TYPE`,`reservation_room`.`reservation_ID` AS `reservation_ID` from (`room` join `reservation_room` on((`room`.`ROOM_NUMBER` = `reservation_room`.`room_NUMBER`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_FK1` FOREIGN KEY (`NAME_HOTLE`) REFERENCES `hotle` (`NAME`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `EMPLOYEE_FK1` FOREIGN KEY (`NAME_HOTLE`) REFERENCES `hotle` (`NAME`);

--
-- Constraints for table `hotle_phone`
--
ALTER TABLE `hotle_phone`
  ADD CONSTRAINT `PHONE_FK1` FOREIGN KEY (`NAME_HOTLE`) REFERENCES `hotle` (`NAME`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `ROOM_FK1` FOREIGN KEY (`NAME_HOTLE`) REFERENCES `hotle` (`NAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
