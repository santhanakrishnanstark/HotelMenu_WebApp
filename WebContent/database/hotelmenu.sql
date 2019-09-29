-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2019 at 04:33 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelmenu`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_record`
--

CREATE TABLE `food_record` (
  `id` int(11) NOT NULL,
  `food_id` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cost` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `category` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_record`
--

INSERT INTO `food_record` (`id`, `food_id`, `name`, `cost`, `availability`, `category`) VALUES
(5, 'BRIYANI37', 'Chicken Briyani', 120, 0, 'lunch'),
(3, 'CHAPATI10', 'Chapati', 15, 1, 'breakfast dinner'),
(1, 'DOSA26', 'Dosa', 100, 1, 'breakfast dinner'),
(6, 'EGG BRIYANI77', 'Egg Briyani', 90, 1, 'lunch'),
(4, 'IDLY45', 'Idly', 6, 1, 'breakfast dinner'),
(7, 'MUTTON BRIYANI72', 'Mutton Briyani', 180, 1, 'lunch'),
(10, 'NOODLES31', 'Noodles', 90, 0, 'breakfast dinner'),
(9, 'PARATTA72', 'Paratta', 10, 1, 'lunch dinner'),
(8, 'PRAWN BRIYANI39', 'Prawn Briyani', 180, 1, 'lunch');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `table_no` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `food_qty` int(11) NOT NULL,
  `food_price` int(11) NOT NULL,
  `food_id` varchar(50) NOT NULL,
  `delivery_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `table_no`, `user_id`, `date`, `food_name`, `food_qty`, `food_price`, `food_id`, `delivery_status`) VALUES
(1, 678, 'USER4117', '2019-09-29', 'CHAPATI', 2, 15, 'CHAPATI10', 'delivered'),
(2, 678, 'USER4117', '2019-09-29', 'DOSA', 1, 100, 'DOSA26', 'Not Delivered'),
(3, 678, 'USER4117', '2019-09-29', 'IDLY', 2, 6, 'IDLY45', 'delivered'),
(4, 678, 'USER764', '2019-09-29', 'DOSA', 1, 100, 'DOSA26', 'Not Delivered'),
(5, 678, 'USER3248', '2019-09-29', 'PRAWN BRIYANI', 2, 180, 'PRAWN BRIYANI39', 'delivered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_record`
--
ALTER TABLE `food_record`
  ADD PRIMARY KEY (`food_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_record`
--
ALTER TABLE `food_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food_record` (`food_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
