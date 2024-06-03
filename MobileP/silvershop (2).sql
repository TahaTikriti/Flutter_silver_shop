-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 04:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silvershop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `silver`
--

CREATE TABLE `silver` (
  `sid` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` float NOT NULL,
  `type` text NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `silver`
--

INSERT INTO `silver` (`sid`, `name`, `price`, `type`, `img`) VALUES
(3, 'Moonlit Elegance Ring', 16, 'ring', 'rpic1.jpg'),
(4, 'Silver Serenity Band', 49, 'ring', 'rpic2.jpg'),
(5, 'Celestial Gleam Ring', 88, 'ring', 'rpic3.jpg'),
(6, 'Enchanting Silver Swirl', 34, 'ring', 'rpic4.jpg'),
(7, 'Frosty Echo Band', 15, 'ring', 'rpic5.jpg'),
(8, 'Twilight Sparkle Ring', 63, 'ring', 'rpic6.jpg'),
(9, 'Shimmering Luna Band', 39, 'ring', 'rpic7.jpg'),
(10, 'Silver Cascade Ring', 32, 'ring', 'rpic8.jpg'),
(11, 'Radiant Silver Halo', 90, 'ring', 'rpic9.jpg'),
(12, 'soon', 1, 'coming', 'ComingSoon/c1.jpg'),
(13, 'soon', 1, 'coming', 'ComingSoon/c2.jpg'),
(14, 'soon', 1, 'coming', 'ComingSoon/c3.jpg'),
(15, 'soon', 1, 'coming', 'ComingSoon/c4.jpg'),
(18, 'Sparkling Studs', 23, 'earring', 'pic1.jpg'),
(19, 'Pearl Drops', 23, 'earring', 'pic2.jpg'),
(20, 'Hoop Elegance', 14, 'earring', 'pic3.jpg'),
(21, 'Floral Bliss Earrings', 12, 'earring', 'pic4.jpg'),
(22, 'Crystal Teardrops', 6, 'earring', 'pic5.jpg'),
(23, 'Vintage Chandeliers', 56, 'earring', 'pic6.jpg'),
(24, 'Gold Tassel Earrings', 34, 'earring', 'pic7.jpg'),
(25, 'Diamond Halo Drops', 21, 'earring', 'pic8.jpg'),
(26, 'Gemstone Danglers', 52, 'earring', 'pic9.jpg'),
(27, 'Ethereal Elegance Necklace', 23, 'necklace', 'pic1.jpg'),
(28, 'Serene Sapphire Strand', 32, 'necklace', 'pic2.jpg'),
(29, 'Charm of the Orient Pendant', 21, 'necklace', 'pic3.jpg'),
(44, 'Luminous Lariat Necklace', 45, 'necklace', 'pic4.jpg'),
(45, 'Gilded Gardenia Collar', 42, 'necklace', 'pic5.jpg'),
(46, 'Azure Twilight Choker', 21, 'necklace', 'pic6.jpg'),
(47, 'Radiant Rose Quartz Necklace', 23, 'necklace', 'pic7.jpg'),
(48, 'Enchanting Emerald Cascade', 34, 'necklace', 'pic8.jpg'),
(49, 'Moonlit Marina Necklace', 67, 'necklace', 'pic9.jpg'),
(50, 'Elegant Diamond Bracelet', 12, 'bracelet', 'pic1.jpg'),
(51, 'Sterling Silver Cuff', 43, 'bracelet', 'pic2.jpg'),
(52, 'Crystal Chain Bracelet', 13, 'bracelet', 'pic3.jpg'),
(53, 'Charm Bangle Bracelet', 45, 'bracelet', 'pic4.jpg'),
(54, 'Pearl Strand Bracelet', 87, 'bracelet', 'pic5.jpg'),
(55, 'Leather Wrap Bracelet', 172, 'bracelet', 'pic6.jpg'),
(56, 'Beaded Stretch Bracelet', 24, 'bracelet', 'pic7.jpg'),
(57, 'Tennis Bracelet with Diamonds', 65, 'bracelet', 'pic8.jpg'),
(58, 'Braided Leather Bracelet', 21, 'bracelet', 'pic9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `userType` varchar(10) NOT NULL,
  `cartid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `USERNAME`, `PASSWORD`, `userType`, `cartid`) VALUES
(1, 'rabih01', '123', 'admin', 0),
(3, 'lama', '321', 'user', 0),
(4, 'taha', '1', 'user', 0),
(5, 'omarf', '123', 'user', 0),
(6, 'user1', '$2y$10$ZAgQoQlNmhb7SrDKetBBX.EcMsL4u4QETqC1lzIG6cUQg4IlZwjEe', 'user', 0),
(7, 'a', '$2y$10$Ext6w488t8fCw99X2SC8kePcqFGEa7pFG8jiRMVRmq/Qfcy0mwlDy', 'user', 0),
(8, 'b', '1', 'user', 0),
(9, 'jad', '123', 'user', 0),
(16, 'hhhh', 'fgh', '', 0),
(17, 'hadh', '1212', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `silver`
--
ALTER TABLE `silver`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `silver`
--
ALTER TABLE `silver`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `silver` (`sid`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
