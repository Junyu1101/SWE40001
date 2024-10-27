-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2024 at 04:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cck_websystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `name`, `price`, `description`, `category`, `image`) VALUES
(1, 'CCK SWEET CORN 500G', 5, 'One of the main nutritional benefits of sweetcorn is its high fibre content. And as we know, dietary fibre is important for our health: it aids digestion, it can decrease the risk of heart disease, strokes.\r\nOn top of that, fibre helps you stay fuller for longer just like consuming potatoes.\r\n', 'Vegetable', 'images/corn_product.jpeg'),
(2, 'CCK CHICKEN NUGGETS 450G', 10, 'food product consisting of a small piece of deboned chicken meat that is breaded or battered\r\nSuggest cooking method : Deep fried or air-fryer\r\nWeight: 900g', 'CCK Products', 'images/chickennuggets.jpeg'),
(3, 'CCK MINCED BEEF 400G', 13, 'Minced beef or beef mince is beef that has been finely chopped with a knife or a meatgrinder or mincing machine.\r\nIt is used in many recipes including hamburgers,spaghetti Bolognese and also used many other Asian cookings.', 'CCK Products', 'images/mincedbeef.jpeg'),
(4, 'CCK FISH BALL (S) 500G', 9, 'Fish balls are balls made from fish paste which are then boiled or deep-fried.', 'CCK Products', 'images/fishball.jpeg'),
(5, 'CCK SATAY BEEF 300G', 26, 'Marinated overnight with spices, skewed to satay and grilled.\r\nBest eaten with local peanut sauce taste juicy and nutty.', 'CCK Products', 'images/beefburger.jpeg'),
(6, 'CCK MIX VEGETABLES 900G_', 8, 'Variety of vegetables mixed in one pack\r\nSuitable for cooking fried rice, soups, dumplings , etc.\r\nConvenient to cook', 'CCK Products', 'images/mixvege.jpeg'),
(7, 'CCK CHICKEN BURGER 900G', 14, 'Preparation method\r\n\r\n1. Defrosting is not required before cooking.\r\n\r\n2. Heat the pan to a temperature of 175 ° C-180 ° C.\r\n\r\n3. Cook each surface for 3 to 4 minutes.', 'Frozen Food', 'images/chickenburger.jpeg'),
(8, 'UNIIFOOD CHICKEN DIM SUM 400G', 17, 'Uniifood Chicken Dim Sum is suitable for steam.', 'Frozen Food', 'images/dimsum.jpeg'),
(9, 'CCK ORIGINAL CHICKEN FRANK 300G', 5, 'Suitable to be eaten as a side dish or as accompaniment in fried rice. \r\nCan be cooked in many ways : Fried, BBQ, Steamboat/Hotpot or cooked in Soup\r\nHalal', 'CCK Products', 'images/orichickenfrank.jpeg'),
(10, 'CCK BREADED POLLOCK FINGER 400G', 16, '16pcs/box\r\n24 Months Shelf Life\r\nHalal Certified\r\n✅Weight: 400G\r\n\r\n\r\nDeep sea pollock fish, coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook\r\n\r\n\r\nServing Suggestion:\r\n\r\nAppetizers\r\nFish & Chips\r\nChildren\'s Menu\r\nFried Platter\r\nFish Taco\r\nSandwich Wraps\r\n\r\n\r\nCooking instructions:\r\n\r\nDeep Fry \r\n175-180°C\r\n2-3 minutes\r\nAir Fryer\r\n\r\n200-220°C\r\n5-8 minutes\r\nOven Heat\r\n\r\n200-220°C\r\n5-8 minutes', 'CCK Products', 'images/pollockfinger.jpeg'),
(11, 'CCK BREADED POLLOCK FILLET 450G', 16, '6pcs/box\r\n24 Months Shelf Life\r\nHalal Certified\r\n✅Weight: 450G\r\n\r\n\r\nDeep sea pollock fish, coated in a crunchy breading\r\nRich in omega-3 fatty acids, Protein\r\nCook from frozen, easy to cook\r\n\r\n\r\nServing Suggestion:\r\n\r\nServes with Fries, Potato, Pickle, Lemon\r\nSandwich/Taco\r\nBun\r\n\r\n\r\nCooking instructions:\r\n\r\nDeep Fry\r\n\r\n175-180 °C\r\n3-4 minutes\r\nAir Fryer\r\n\r\n200 °C\r\n7-8 minutes', 'CCK Products', 'images/pollockfillet.jpeg'),
(12, 'CCK PREMIO BEEF BALL 500G', 13.7, '', 'CCK Products', 'images/premiobeefball.jpeg'),
(13, 'CCK CRAB MEAT STICK 200G', 3.1, 'Suitable for steamboat, hotpot, BBQ & soups.\r\nStorage: Keep frozen at -18°C. Do not refreeze.', 'CCK Products', 'images/crabstick.jpeg'),
(14, 'CCK SEAFOOD MASTER SALAD SALMON 60G', 7.9, 'Flavours included:\r\nSmoked\r\nSweet BBQ\r\nRattan Pepper', 'CCK Products', 'images/saladsalmon60.jpeg'),
(15, 'CCK SATAY CHICKEN 300G', 15.2, 'Marinated overnight with spices, skewed to satay and grilled.\r\nBest eaten with local peanut sauce taste juicy and nutty.', 'CCK Products', 'images/sataychicken.jpeg'),
(16, 'CCK GOLDEN FISH CAKE 450G', 9.8, 'It is somewhat like a sausage made of fish meat.\r\nIt is a simple, tasty and affordable version of a dish for fish\r\nTaste savory with soft texture and can have various flavors depending on the additional ingredient', 'CCK Products', 'images/fishcake450g.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
