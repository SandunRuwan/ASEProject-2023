-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2023 at 04:01 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE IF NOT EXISTS `admin_credentials` (
  `USERNAME` varchar(50) COLLATE utf16_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf16_bin NOT NULL,
  `PHARMACY_NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(100) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`, `PHARMACY_NAME`, `ADDRESS`, `EMAIL`, `CONTACT_NUMBER`) VALUES
('admin', 'admin123', 'Dinunuwan Pharmacy', 'Colombo Road, Alawwa', 'dinunuwan_pharmacy@gmail.com', '0764403531');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL,
  `DOCTOR_NAME` varchar(20) COLLATE utf16_bin NOT NULL,
  `DOCTOR_ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `DOCTOR_NAME`, `DOCTOR_ADDRESS`) VALUES
(1, 'Malinda', '0712650027', 'Colombo Road, Alawwa', 'Nayomi', 'Colombo Road, Alawwa');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `INVOICE_DATE` date NOT NULL,
  `TOTAL_AMOUNT` int(20) NOT NULL,
  `TOTAL_DISCOUNT` int(20) NOT NULL,
  `NET_TOTAL` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `CUSTOMER_ID`, `INVOICE_DATE`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`, `NET_TOTAL`) VALUES
(1, 1, '2023-08-16', 500, 0, 500),
(2, 1, '2023-08-17', 500, 0, 500),
(3, 1, '2023-08-17', 250, 0, 250),
(4, 1, '2023-10-25', 2500, 0, 2500),
(0, 1, '2023-10-26', 2500, 0, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE IF NOT EXISTS `medicines` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `PACKING` varchar(30) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `GENERIC_NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `SUPPLIER_NAME` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(1, 'Panadol', '10', 'Panadol Tablet', 'ABC Supplier'),
(2, 'Dompiron', '1', 'DPR', 'ABC Supplier'),
(3, 'Dompiron', '2', 'DPR', 'ABC Supplier');

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

CREATE TABLE IF NOT EXISTS `medicines_stock` (
  `NAME` varchar(100) NOT NULL,
  `BATCH_ID` int(11) NOT NULL,
  `EXPIRY_DATE` varchar(20) NOT NULL,
  `QUANTITY` int(20) NOT NULL,
  `MRP` int(20) NOT NULL,
  `RATE` int(11) NOT NULL,
  `INVOICE_NUMBER` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`, `INVOICE_NUMBER`) VALUES
('Dompiron', 10045, '01/25', 5, 250, 200, 100123),
('Panadol', 1, '12/24', 80, 250, 200, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `SUPPLIER_NAME` varchar(100) NOT NULL,
  `INVOICE_NUMBER` int(20) NOT NULL,
  `PURCHASE_DATE` date NOT NULL,
  `TOTAL_AMOUNT` int(30) NOT NULL,
  `PAYMENT_STATUS` varchar(11) NOT NULL,
  `VOUCHER_NUMBER` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`SUPPLIER_NAME`, `INVOICE_NUMBER`, `PURCHASE_DATE`, `TOTAL_AMOUNT`, `PAYMENT_STATUS`, `VOUCHER_NUMBER`) VALUES
('ABC Supplier', 100101, '2023-08-16', 5000, 'PAID', 100),
('ABC Supplier', 100123, '2023-08-16', 200, 'PAID', 101),
('ABC Supplier', 100124, '2023-08-16', 2000, 'PAID', 102),
('ABC Supplier', 100125, '2023-10-25', 20000, 'PAID', 103);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `CUSTOMER_ID` int(20) NOT NULL,
  `INVOICE_NUMBER` int(20) NOT NULL,
  `MEDICINE_NAME` varchar(30) NOT NULL,
  `BATCH_ID` int(20) NOT NULL,
  `EXPIRY_DATE` date NOT NULL,
  `QUANTITY` int(30) NOT NULL,
  `MRP` int(30) NOT NULL,
  `DISCOUNT` int(30) NOT NULL,
  `TOTAL` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(30) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(1, 'ABC Supplier', 'abc_supllier@gmail.com', '0764403531', 'Kandy Road, Peradeniya');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
