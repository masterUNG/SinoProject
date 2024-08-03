-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2024 at 01:42 PM
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
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `staffsurname` varchar(50) NOT NULL,
  `staffno` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `branch_id` varchar(50) NOT NULL,
  `user_level` varchar(50) NOT NULL,
  `user_branch` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `pea_id` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `leader` varchar(50) NOT NULL,
  `user_date` varchar(50) NOT NULL,
  `ref_user_id` varchar(50) NOT NULL,
  `user_id_card` varchar(50) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_bank_name` varchar(50) NOT NULL,
  `user_bank_number` varchar(50) NOT NULL,
  `user_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `staffname`, `staffsurname`, `staffno`, `username`, `password`, `branch_id`, `user_level`, `user_branch`, `user_email`, `pea_id`, `user_type`, `user_status`, `leader`, `user_date`, `ref_user_id`, `user_id_card`, `user_phone`, `user_address`, `user_bank_name`, `user_bank_number`, `user_img`) VALUES
(1, 'สิงห์โต โนนกลาง', 'อึ่ง', '', 'master', '123456', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
