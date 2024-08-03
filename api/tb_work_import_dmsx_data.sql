-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2024 at 02:28 PM
-- Server version: 10.6.17-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `androidh_fluttertraining`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_work_import_dmsx_data`
--

CREATE TABLE `tb_work_import_dmsx_data` (
  `id` int(11) NOT NULL,
  `ca` varchar(50) NOT NULL,
  `docID` varchar(50) NOT NULL,
  `notice` varchar(50) NOT NULL,
  `employeeId` varchar(50) NOT NULL,
  `employeeName` varchar(50) NOT NULL,
  `pea_no` varchar(50) NOT NULL,
  `cus_name` varchar(50) NOT NULL,
  `line` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_txt` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_txt` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `address` varchar(225) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `arrears` varchar(50) NOT NULL,
  `images` varchar(50) NOT NULL,
  `readNumber` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `paymentDate` varchar(50) NOT NULL,
  `dataStatus` varchar(50) NOT NULL,
  `refnoti_date` varchar(50) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `import_date` varchar(50) NOT NULL,
  `image_befor_wmmr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_work_import_dmsx_data`
--
ALTER TABLE `tb_work_import_dmsx_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_work_import_dmsx_data`
--
ALTER TABLE `tb_work_import_dmsx_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
