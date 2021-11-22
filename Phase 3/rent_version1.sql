-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 14, 2020 at 07:23 PM
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
-- Database: `rent`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability_info`
--

DROP TABLE IF EXISTS `availability_info`;
CREATE TABLE IF NOT EXISTS `availability_info` (
  `availability_pk` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ref_vehicle_id` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `return_date` date NOT NULL,
  `no_of_days` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`availability_pk`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `availability_info`
--

INSERT INTO `availability_info` (`availability_pk`, `created_on`, `ref_vehicle_id`, `start_date`, `return_date`, `no_of_days`) VALUES
(1, '2020-12-13 23:54:01', '19VDE1F3XEE414842', '2019-11-01', '2019-11-15', 1),
(2, '2020-12-13 23:54:01', '19VDE1F3XEE414842', '2019-07-01', '2019-07-08', 1),
(3, '2020-12-13 23:54:01', '19VDE1F3XEE414842', '2019-07-09', '2019-07-11', 1),
(4, '2020-12-13 23:54:01', '19VDE1F3XEE414842', '2020-01-01', '2020-01-29', 1),
(5, '2020-12-13 23:54:01', 'JTHFF2C26F135BX45', '2019-05-01', '2019-05-08', 1),
(6, '2020-12-13 23:54:01', 'JTHFF2C26F135BX45', '2019-11-01', '2019-11-15', 1),
(7, '2020-12-13 23:54:01', 'JTHFF2C26F135BX45', '2020-01-01', '2020-01-29', 1),
(8, '2020-12-13 23:54:01', 'WAUTFAFH0E0010613', '2019-11-01', '2019-11-15', 1),
(9, '2020-12-13 23:54:01', 'WAUTFAFH0E0010613', '2019-07-01', '2019-07-08', 1),
(10, '2020-12-13 23:54:01', 'WAUTFAFH0E0010613', '2019-07-09', '2019-07-11', 1),
(11, '2020-12-13 23:54:01', 'WAUTFAFH0E0010613', '2020-01-01', '2020-01-29', 1),
(12, '2020-12-13 23:54:01', 'WBA3A9G51ENN73366', '2019-11-01', '2019-11-15', 1),
(13, '2020-12-13 23:54:01', 'WBA3A9G51ENN73366', '2020-01-01', '2020-01-29', 1),
(14, '2020-12-13 23:54:01', 'WBA3B9C59EP458859', '2019-11-01', '2019-11-15', 1),
(15, '2020-12-13 23:54:01', 'WBA3B9C59EP458859', '2020-01-01', '2020-01-29', 1),
(16, '2020-12-13 23:54:01', 'WDCGG0EB0EG188709', '2019-11-01', '2019-11-15', 1),
(17, '2020-12-13 23:54:01', 'WDCGG0EB0EG188709', '2020-01-01', '2020-01-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE IF NOT EXISTS `customer_info` (
  `internal_pk` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  PRIMARY KEY (`internal_pk`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`internal_pk`, `created_on`, `customer_id`, `customer_name`, `customer_phone`) VALUES
(1, '2020-12-13 22:17:53', '201', 'A. Parks', '(214) 555-0127'),
(2, '2020-12-13 22:17:53', '202', 'S. Patel', '(849) 811-6298'),
(3, '2020-12-13 22:17:53', '203', 'A. Hernandez', '(355) 572-5385'),
(4, '2020-12-13 22:17:53', '204', 'G. Carver', '(753) 763-8656'),
(5, '2020-12-13 22:17:53', '205', 'Sh. Byers', '(912) 925-5332'),
(6, '2020-12-13 22:17:53', '206', 'L. Lutz', '(931) 966-1775'),
(7, '2020-12-13 22:17:53', '207', 'L. Bernal', '(884) 727-0591'),
(8, '2020-12-13 22:17:53', '208', 'I. Whyte', '(811) 979-7345'),
(9, '2020-12-13 22:17:53', '209', 'L. Lott', '(954) 706-2219'),
(10, '2020-12-13 22:17:53', '210', 'G. Clarkson', '(309) 625-1838'),
(11, '2020-12-13 22:17:53', '211', 'Sh. Dunlap', '(604) 581-6642'),
(12, '2020-12-13 22:17:53', '212', 'H. Gallegos', '(961) 265-8638'),
(13, '2020-12-13 22:17:53', '213', 'L. Perkins', '(317) 996-3104'),
(14, '2020-12-13 22:17:53', '214', 'M. Beach', '(481) 422-0282'),
(15, '2020-12-13 22:17:53', '215', 'C. Pearce', '(599) 881-5189'),
(16, '2020-12-13 22:17:53', '216', 'A. Hess', '(516) 570-6411'),
(17, '2020-12-13 22:17:53', '217', 'M. Lee', '(369) 898-6162'),
(18, '2020-12-13 22:17:53', '218', 'R. Booker', '(730) 784-6303'),
(19, '2020-12-13 22:17:53', '219', 'A. Crowther', '(325) 783-4081'),
(20, '2020-12-13 22:17:53', '220', 'H. Mahoney', '(212) 262-8829'),
(21, '2020-12-13 22:17:53', '221', 'J. Brown', '(644) 756-0110'),
(22, '2020-12-13 22:17:53', '222', 'H. Stokes', '(931) 969-7317'),
(23, '2020-12-13 22:17:53', '223', 'J. Reeves', '(940) 981-5113'),
(24, '2020-12-13 22:17:53', '224', 'A. Mcghee', '(838) 610-5802'),
(25, '2020-12-13 22:17:53', '225', 'L. Mullen', '(798) 331-7777'),
(26, '2020-12-13 22:17:53', '226', 'R. Armstrong', '(325) 783-4081'),
(27, '2020-12-13 22:17:53', '227', 'J. Greenaway', '(212) 262-8829'),
(28, '2020-12-13 22:17:53', '228', 'K. Kaiser Acosta', '(228) 576-1557'),
(29, '2020-12-13 22:17:53', '229', 'D. Kirkpatrick', '(773) 696-8009'),
(30, '2020-12-13 22:17:53', '230', 'A. Odonnell', '(439) 536-8929'),
(31, '2020-12-13 22:17:53', '231', 'K. Kay', '(368) 336-5403');

-- --------------------------------------------------------

--
-- Table structure for table `rental_info`
--

DROP TABLE IF EXISTS `rental_info`;
CREATE TABLE IF NOT EXISTS `rental_info` (
  `internal_pk` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ref_vehicle_id` varchar(50) NOT NULL,
  `ref_customer_id` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `order_date` date NOT NULL,
  `return_date` date NOT NULL,
  `rental_type` int(11) NOT NULL DEFAULT '1',
  `rental_qty` int(11) NOT NULL DEFAULT '1',
  `total_amount` float NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`internal_pk`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental_info`
--

INSERT INTO `rental_info` (`internal_pk`, `created_on`, `ref_vehicle_id`, `ref_customer_id`, `start_date`, `order_date`, `return_date`, `rental_type`, `rental_qty`, `total_amount`, `payment_date`) VALUES
(1, '2020-12-14 00:37:40', 'JM3KE4DY4F0441471', '203', '2019-09-09', '2019-05-22', '2019-09-13', 1, 4, 460, '2019-09-09'),
(2, '2020-12-14 00:41:30', '19VDE1F3XEE414842', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(3, '2020-12-14 00:41:47', 'JTHFF2C26F135BX45', '210', '2019-05-01', '2019-04-15', '2019-05-08', 7, 1, 600, '2019-05-08'),
(4, '2020-12-14 00:43:01', 'JTHFF2C26F135BX45', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(5, '2020-12-14 00:43:01', 'WAUTFAFH0E0010613', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(6, '2020-12-14 00:43:01', 'WBA3A9G51ENN73366', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(7, '2020-12-14 00:43:01', 'WBA3B9C59EP458859', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(8, '2020-12-14 00:43:01', 'WDCGG0EB0EG188709', '210', '2019-11-01', '2019-10-28', '2019-11-15', 7, 2, 1200, NULL),
(9, '2020-12-14 00:43:01', '19VDE1F3XEE414842', '212', '2019-06-10', '2019-04-15', '2019-07-01', 7, 3, 1800, '2019-06-10'),
(10, '2020-12-14 00:43:01', '1N6BF0KM0EN101134', '216', '2019-08-02', '2019-03-15', '2019-08-30', 7, 4, 2740, '2019-08-02'),
(11, '2020-12-14 00:43:01', '1N6BF0KM0EN101134', '216', '2019-08-30', '2019-03-15', '2019-09-01', 1, 2, 230, '2019-08-02'),
(12, '2020-12-14 00:43:01', '19VDE1F3XEE414842', '221', '2019-07-01', '2019-06-12', '2019-07-08', 7, 1, 600, '2019-07-01'),
(13, '2020-12-14 00:43:01', '19VDE1F3XEE414842', '221', '2019-07-09', '2019-06-12', '2019-07-11', 1, 2, 200, '2019-07-01'),
(14, '2020-12-14 00:43:01', '19VDE1F3XEE414842', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(15, '2020-12-14 00:43:01', 'JTHFF2C26F135BX45', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(16, '2020-12-14 00:43:01', 'WAUTFAFH0E0010613', '221', '2019-07-01', '2019-06-12', '2019-07-08', 7, 1, 600, '2019-07-01'),
(17, '2020-12-14 00:43:01', 'WAUTFAFH0E0010613', '221', '2019-07-09', '2019-06-12', '2019-07-11', 1, 2, 200, '2019-07-01'),
(18, '2020-12-14 00:43:01', 'WAUTFAFH0E0010613', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(19, '2020-12-14 00:43:01', 'WBA3A9G51ENN73366', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(20, '2020-12-14 00:43:01', 'WBA3B9C59EP458859', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(21, '2020-12-14 00:43:01', 'WDCGG0EB0EG188709', '221', '2020-01-01', '2019-12-15', '2020-01-29', 7, 4, 2400, NULL),
(22, '2020-12-14 00:43:01', '19VDE1F3XEE414842', '229', '2019-05-06', '2019-04-12', '2019-06-10', 1, 4, 400, '2019-05-06'),
(23, '2020-12-14 00:43:01', 'WAUTFAFH0E0010613', '229', '2019-05-06', '2019-04-12', '2019-06-10', 1, 4, 400, '2019-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_info`
--

DROP TABLE IF EXISTS `vehicle_info`;
CREATE TABLE IF NOT EXISTS `vehicle_info` (
  `internal_pk` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vehicle_id` varchar(50) NOT NULL,
  `vehicle_description` varchar(50) NOT NULL,
  `vehicle_year` int(11) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `vehicle_category` int(11) NOT NULL,
  PRIMARY KEY (`internal_pk`),
  UNIQUE KEY `vehicle_id` (`vehicle_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_info`
--

INSERT INTO `vehicle_info` (`internal_pk`, `created_on`, `vehicle_id`, `vehicle_description`, `vehicle_year`, `vehicle_type`, `vehicle_category`) VALUES
(1, '2020-12-13 22:30:01', '19VDE1F3XEE414842', 'Acura ILX', 2014, 1, 1),
(2, '2020-12-13 22:30:01', '1FDEE3FL6EDA29122', 'Ford E 350', 2014, 6, 0),
(3, '2020-12-13 22:30:01', '1FDRF3B61FEA87469', 'Ford Super Duty Pickup', 2015, 5, 0),
(4, '2020-12-13 22:30:01', '1FTNF1CF2EKE54305', 'Ford F Series Pickup', 2014, 5, 0),
(5, '2020-12-13 22:30:01', '1G1JD5SB3E4240835', 'Chevrolet Optra', 2014, 1, 0),
(6, '2020-12-13 22:30:01', '1GB3KZCG1EF117132', 'Chevrolet Silverado', 2014, 5, 0),
(7, '2020-12-13 22:30:01', '1HGCR2E3XEA305302', 'Honda Accord', 2014, 2, 0),
(8, '2020-12-13 22:30:01', '1N4AB7AP2EN855026', 'Nissan Sentra', 2014, 1, 0),
(9, '2020-12-13 22:30:01', '1N6BA0EJ9EN516565', 'Nissan Titan', 2014, 5, 0),
(10, '2020-12-13 22:30:01', '1N6BF0KM0EN101134', 'Nissan NV', 2014, 6, 0),
(11, '2020-12-13 22:30:01', '1VWCH7A3XEC037969', 'Volkswagen Passat', 2014, 2, 1),
(12, '2020-12-13 22:30:01', '2HGFB2F94FH501940', 'Honda Civic', 2015, 1, 0),
(13, '2020-12-13 22:30:01', '2T3DFREV0FW317743', 'Toyota RAV4', 2015, 4, 0),
(14, '2020-12-13 22:30:01', '3MZBM1L74EM109736', 'Mazda 3', 2014, 1, 0),
(15, '2020-12-13 22:30:01', '3N1CE2CP0FL409472', 'Nissan Versa Note', 2015, 1, 0),
(16, '2020-12-13 22:30:01', '3N1CN7APXEK444458', 'Nissan Versa', 2014, 1, 0),
(17, '2020-12-13 22:30:01', '3VW2A7AU1FM012211', 'Volkswagen Golf', 2015, 1, 0),
(18, '2020-12-13 22:30:01', '4S4BRCFC1E3203823', 'Subaru Outback', 2014, 4, 0),
(19, '2020-12-13 22:30:01', '4S4BSBF39F3261064', 'Subaru Outback', 2015, 4, 0),
(20, '2020-12-13 22:30:01', '4S4BSELC0F3325370', 'Subaru Outback', 2015, 4, 0),
(21, '2020-12-13 22:30:01', '5FNRL6H58KB133711', 'Honda Odyssey', 2019, 6, 1),
(22, '2020-12-13 22:30:01', '5J6RM4H90FL028629', 'Honda CR-V', 2015, 4, 0),
(23, '2020-12-13 22:30:01', '5N1AL0MM8EL549388', 'Infiniti JX35', 2014, 4, 1),
(24, '2020-12-13 22:30:01', '5NPDH4AE2FH565275', 'Hyundai Elantra', 2015, 1, 0),
(25, '2020-12-13 22:30:01', '5TDBKRFH4ES26D590', 'Toyota Highlander', 2014, 4, 0),
(26, '2020-12-13 22:30:01', '5XYKT4A75FG610224', 'Kia Sorento', 2015, 4, 0),
(27, '2020-12-13 22:30:01', '5XYKU4A7XFG622415', 'Kia Sorento', 2015, 4, 0),
(28, '2020-12-13 22:30:01', '5XYKUDA77EG449709', 'Kia Sorento', 2014, 4, 0),
(29, '2020-12-13 22:30:01', 'JF1GPAA61F8314971', 'Subaru Impreza', 2015, 1, 0),
(30, '2020-12-13 22:30:01', 'JH4KC1F50EC800004', 'Acura RLX', 2014, 3, 1),
(31, '2020-12-13 22:30:01', 'JH4KC1F56EC000095', 'Acura RLX', 2014, 3, 1),
(32, '2020-12-13 22:30:01', 'JM1BM1V35E1210570', 'Mazda 3', 2014, 1, 0),
(33, '2020-12-13 22:30:01', 'JM3KE4DY4F0441471', 'Mazda CX5', 2015, 4, 0),
(34, '2020-12-13 22:30:01', 'JM3TB3DV0E0015742', 'Mazda CX9', 2014, 4, 0),
(35, '2020-12-13 22:30:01', 'JN8AS5MV0FW760408', 'Nissan Rogue Select', 2015, 4, 0),
(36, '2020-12-13 22:30:01', 'JTEZUEJR7E5081641', 'Toyota 4Runner', 2014, 4, 0),
(37, '2020-12-13 22:30:01', 'JTHBW1GG1F120DU53', 'Lexus ES 300h', 2015, 2, 1),
(38, '2020-12-13 22:30:01', 'JTHCE1BL3F151DE04', 'Lexus GS 350', 2015, 2, 1),
(39, '2020-12-13 22:30:01', 'JTHDL5EF9F5007221', 'Lexus LS 460', 2015, 3, 1),
(40, '2020-12-13 22:30:01', 'JTHFF2C26F135BX45', 'Lexus IS 250C', 2015, 1, 1),
(41, '2020-12-13 22:30:01', 'JTJHY7AX2F120EA11', 'Lexus LX 570', 2015, 4, 1),
(42, '2020-12-13 22:30:01', 'JTJJM7FX2E152CD75', 'Lexus GX460', 2014, 4, 1),
(43, '2020-12-13 22:30:01', 'JTMBFREV1FJ019885', 'Toyota RAV4', 2015, 4, 0),
(44, '2020-12-13 22:30:01', 'KM8SN4HF0FU107203', 'Hyundai Santa Fe', 2015, 4, 0),
(45, '2020-12-13 22:30:01', 'KMHJT3AF1FU028211', 'Hyundai Tucson', 2015, 4, 0),
(46, '2020-12-13 22:30:01', 'KMHTC6AD8EU998631', 'Hyundai Veloster', 2014, 1, 0),
(47, '2020-12-13 22:30:01', 'KNAFZ4A86E5195865', 'KIA Sportage', 2014, 4, 0),
(48, '2020-12-13 22:30:01', 'KNAFZ4A86E5195895', 'KIA Forte', 2014, 1, 0),
(49, '2020-12-13 22:30:01', 'KNAGN4AD2F5084324', 'Kia Optima Hybrid', 2015, 2, 0),
(50, '2020-12-13 22:30:01', 'KNALN4D75E5A57351', 'Kia Cadenza', 2014, 3, 0),
(51, '2020-12-13 22:30:01', 'KNALU4D42F6025717', 'Kia K900', 2015, 3, 0),
(52, '2020-12-13 22:30:01', 'KNDPCCA65F7791085', 'KIA Sportage', 2015, 4, 0),
(53, '2020-12-13 22:30:01', 'WA1LGAFE8ED001506', 'Audi Q7', 2014, 4, 1),
(54, '2020-12-13 22:30:01', 'WAU32AFD8FN005740', 'Audi A8', 2015, 3, 1),
(55, '2020-12-13 22:30:01', 'WAUTFAFH0E0010613', 'Audi A5', 2014, 1, 1),
(56, '2020-12-13 22:30:01', 'WBA3A9G51ENN73366', 'BMW 3 Series', 2014, 1, 1),
(57, '2020-12-13 22:30:01', 'WBA3B9C59EP458859', 'BMW 3 Series', 2014, 1, 1),
(58, '2020-12-13 22:30:01', 'WBAVL1C57EVR93286', 'BMW X1', 2014, 4, 1),
(59, '2020-12-13 22:30:01', 'WDCGG0EB0EG188709', 'Mercedes_Benz GLK', 2014, 1, 1),
(60, '2020-12-13 22:30:01', 'YV440MDD6F2617077', 'Volvo XC60', 2015, 4, 1),
(61, '2020-12-13 22:30:01', 'YV4940NB5F1191453', 'Volvo XC70', 2015, 4, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
