-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 02, 2016 at 02:25 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `471db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `admin_user` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Contains`
--

CREATE TABLE `Contains` (
  `item_name` varchar(20) NOT NULL,
  `ingredient_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `uname` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `branch_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`uname`, `pw`, `fname`, `lname`, `email`, `branch_name`) VALUES
('j', 'j', 'j', 'j', 'j', 'derp'),
('l', 'l', 'l', 'l', 'l', '');

-- --------------------------------------------------------

--
-- Table structure for table `Dietary_Restriction`
--

CREATE TABLE `Dietary_Restriction` (
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Favourite`
--

CREATE TABLE `Favourite` (
  `cust_user` varchar(20) NOT NULL,
  `item_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `ingredient_name` varchar(20) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient_Rest`
--

CREATE TABLE `Ingredient_Rest` (
  `ingredient_name` varchar(20) NOT NULL,
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Menu_item`
--

CREATE TABLE `Menu_item` (
  `item_name` varchar(20) NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `total_calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Restricted_by`
--

CREATE TABLE `Restricted_by` (
  `cust_user` varchar(20) NOT NULL,
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Serves`
--

CREATE TABLE `Serves` (
  `restaurant_id` varchar(10) NOT NULL,
  `item_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Store`
--

CREATE TABLE `Store` (
  `restaurant_id` varchar(10) NOT NULL,
  `admin_user` varchar(20) NOT NULL,
  `restaurant_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Store`
--

INSERT INTO `Store` (`restaurant_id`, `admin_user`, `restaurant_name`) VALUES
('123', 'hello', 'hi derp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`admin_user`);

--
-- Indexes for table `Contains`
--
ALTER TABLE `Contains`
  ADD PRIMARY KEY (`item_name`,`ingredient_name`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `Dietary_Restriction`
--
ALTER TABLE `Dietary_Restriction`
  ADD PRIMARY KEY (`dr_name`);

--
-- Indexes for table `Favourite`
--
ALTER TABLE `Favourite`
  ADD PRIMARY KEY (`cust_user`,`item_name`);

--
-- Indexes for table `Ingredient`
--
ALTER TABLE `Ingredient`
  ADD PRIMARY KEY (`ingredient_name`);

--
-- Indexes for table `Ingredient_Rest`
--
ALTER TABLE `Ingredient_Rest`
  ADD PRIMARY KEY (`ingredient_name`,`dr_name`);

--
-- Indexes for table `Menu_item`
--
ALTER TABLE `Menu_item`
  ADD PRIMARY KEY (`item_name`);

--
-- Indexes for table `Restricted_by`
--
ALTER TABLE `Restricted_by`
  ADD PRIMARY KEY (`cust_user`,`dr_name`);

--
-- Indexes for table `Serves`
--
ALTER TABLE `Serves`
  ADD PRIMARY KEY (`restaurant_id`,`item_name`);

--
-- Indexes for table `Store`
--
ALTER TABLE `Store`
  ADD PRIMARY KEY (`restaurant_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
