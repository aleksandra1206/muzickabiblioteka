-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2023 at 02:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musiclibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `year` int(4) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `album` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `userid`, `title`, `artist`, `year`, `genre`, `country`, `album`, `created_at`) VALUES
(1, 1, 'Better Now', 'Post Malone', 2018, 'Hip-hop', 'USA', 'Beerbongs & Bentleys', '2023-1-17 15:21:06'),
(2, 1, 'We\'re Good', 'Dua Lipa', 2021, 'Pop', 'USA', 'Single', '2023-1-17 15:22:11'),
(3, 1, 'Astrothunder', 'Travis Scott', 2018, 'Hip-hop', 'United States', 'Astroworld', '2023-1-17 15:57:52'),
(4, 2, 'Sorry', 'Madonna', 2005, 'Dance', 'United States', 'Confessions on a Dance Floor', '2023-1-17 16:22:45'),
(5, 1, 'Still Don\'t Know My Name', 'Labrinth', 2019, 'Pop', 'United States', 'Euphoria', '2023-1-17 16:22:45'),
(6, 2, 'Devil Eyes', 'Hippie Sabotage', 2016, 'RnB', 'United States', 'Providence', '2023-1-17 16:22:45'),
(7, 1, 'Everytime We Touch', 'Cascada', 2010, 'Pop', 'United States', 'Everytime We Touch', '2023-1-17 16:22:45'),
(8, 2, 'One More Year', 'Tame Impala', 2020, 'Pop', 'United States', 'The Slow Rush', '2023-1-17 16:22:45'),
(9, 1, 'Tourner Lans Le Vide', 'Indila', 2014, 'Pop', 'France', 'Mini World', '2023-1-17 16:22:45'),
(10, 2, 'Patience', 'Guns N Roses', 1988, 'Rock', 'United States', 'G N Lies', '2023-1-17 16:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `created_at`) VALUES
(1, 'ap20190053@student.fon.bg.ac.rs', '20190053', '20190053', '2023-01-17 14:42:34'),
(2, 'aleksandra.p@gmail.com', 'aleksandra', 'aleksandra', '2023-01-17 15:35:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `song_ibfk_1` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `song_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
