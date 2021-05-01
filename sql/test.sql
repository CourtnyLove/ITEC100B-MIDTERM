-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 04:05 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `id_code` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`id_code`, `user_id`, `code`, `created_at`, `expiration`) VALUES
(1, 1, '432675', '2021-04-25 02:01:47', '2021-04-25 02:06:47'),
(2, 1, '897148', '2021-04-25 02:01:56', '2021-04-25 02:06:56'),
(3, 3, '967745', '2021-04-25 22:02:54', '2021-04-25 22:07:54'),
(4, 3, '084836', '2021-04-25 22:02:59', '2021-04-25 22:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `logid` int(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `activity` varchar(200) NOT NULL,
  `dateandtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`logid`, `user_id`, `username`, `activity`, `dateandtime`) VALUES
(1, 1, 'jerard03', 'Changed Password', '2021-04-25 01:43:31'),
(2, 1, 'jerard03', 'Logged In', '2021-04-25 02:01:47'),
(3, 1, 'jerard03', 'Entered Successsful Code', '2021-04-25 02:01:56'),
(4, 1, 'jerard03', 'Logged Out', '2021-04-25 02:02:01'),
(5, 3, 'pierce', 'Logged In', '2021-04-25 22:02:53'),
(6, 3, 'pierce', 'Entered Successsful Code', '2021-04-25 22:02:59'),
(7, 3, 'pierce', 'Logged Out', '2021-04-25 22:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `created_at`) VALUES
(1, 'Basti Jerard Trinidad', 'bjtrinidad03@gmail.com', 'jerard03', 'BastiJerard03.', '2021-04-24 21:22:05'),
(2, 'Lyza Marie Murillo', 'lmmurillo09@gmail.com', 'lyza', 'LyzaMarie09.', '2021-04-24 22:49:07'),
(3, 'Pierce William Donato', 'pwdonato31@gmail.com', 'pierce', 'PierceWilliam31.', '2021-04-25 01:43:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id_code`),
  ADD KEY `test` (`user_id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `test1` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `logid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `code`
--
ALTER TABLE `code`
  ADD CONSTRAINT `test` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `userlog`
--
ALTER TABLE `userlog`
  ADD CONSTRAINT `test1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
