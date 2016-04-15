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

INSERT INTO `Dietary_Restriction` (`dr_name`) VALUES
('Celiac''s Disease'),
('Lactose Intolerance'),
('Gluten Intolerance'),
('Vegan'),
('Vegetarianism'),
('Low-Calorie'),
('Nut Allergy'),
('Ovo Vegetarianism');

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


INSERT INTO `Ingredient_Rest` (`ingredient_name`, `dr_name`) VALUES
('Wheat', 'Gluten Intolerance'),
('Oats', 'Gluten Intolerance'),
('Wheat', 'Celiac''s disease'),
('Oats', 'Celiac''s disease'),
('Barley', 'Celiac''s disease'),
('Barley', 'Gluten Intolerance'),
('Egg', 'Ovo Vegetarianism'),
('Tree Nuts', 'Nut Allergy'),
('Milk', 'Lactose Intolerance'),
('Soy', 'Celiac''s disease'),
('Peanuts', 'Nut Allergy'),
('Meat', 'Vegetarianism'),
('Milk', 'Vegan'),
('Egg', 'Vegan'),
('Meat', 'Vegan'),
('Gelatin', 'Vegan');


-- --------------------------------------------------------

--
-- Table structure for table `Menu_item`
--

CREATE TABLE `Menu_item` (
  `item_name` varchar(20) NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `total_calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Menu_item` (`item_name`, `meal_type`, `total_calories`) VALUES
('V Berry Bran Muffin', 'Baked Goods', 380),
('Pumpkin Spice Muffin', 'Baked Goods', 420),
('Barley Zucch Muffin', 'Baked Goods', 300),
('Cran Orange Muffin', 'Baked Goods', 330),
('White Ch/Berry Scone', 'Baked Goods', 330),
('Cinnamon Roll', 'Baked Goods', 440),
('Choc Hazelnut Crunch', 'Baked Goods', 460),
('Maple Pecan Danish', 'Baked Goods', 400),
('Broccoli Chs Scone', 'Baked Goods', 300),
('Mediterranean Scone', 'Baked Goods', 300),
('Choc Zucchini Loaf', 'Sweet Treats', 260),
('Choc Banana Loaf', 'Sweet Treats', 320),
('Carrot Cake', 'Sweet Treats', 420),
('Apple Cran Crisp', 'Sweet Treats', 270),
('Choc Chipper Cookie', 'Sweet Treats', 210),
('Nuttier PB Cookie', 'Sweet Treats', 210),
('Zingy Ginger Cookie', 'Sweet Treats', 210),
('Black/White Cookie', 'Sweet Treats', 200),
('Earl Grey Cookie', 'Sweet Treats', 240),
('Almond Biscotti', 'Sweet Treats', 210),
('Coconut Macaroons', 'Sweet Treats', 120),
('Cran Blondies', 'Sweet Treats', 280),
('Rice Krispy Square', 'Sweet Treats', 330),
('Date Square', 'Sweet Treats', 420),
('Praline Brownie', 'Sweet Treats', 430),
('Granola Bar', 'Sweet Treats', 390),
('Granola Parfait', 'Breakfast', 640),
('Steel Cut Oatmeal', 'Breakfast', 170),
('Multigrain Toast', 'Breakfast', 90),
('SW Breakfast Bake', 'Breakfast', 230),
('Breakfast Panini', 'Breakfast', 560),
('SW Breakfast Wrap', 'Breakfast', 420),
('Caprese Sandwich', 'Lunch', 510),
('Roast Beef/Arugula', 'Lunch', 590),
('Italian Deli Sndwich', 'Lunch', 600),
('Tuscan Tunawich', 'Lunch', 340),
('Kale Pesto Flatbread', 'Lunch', 290),
('Sicilian Flatbread', 'Lunch', 290),
('Chck/Egg Noodle Soup', 'Lunch', 200),
('Chddr/Tomato Soup', 'Lunch', 320),
('Splt Pea/Barley Soup', 'Lunch', 260),
('Minestrone Soup', 'Lunch', 130),
('Crm Cauliflower Soup', 'Lunch', 400),
('Prairie Chowder', 'Lunch', 570),
('Mac & Cheese', 'Lunch', 580),
('Lentil/Bean Stew', 'Lunch', 350),
('Chicken Pot Pie', 'Lunch', 520),
('Beef Stroganoff', 'Lunch', 470),
('Fruit Salad', 'Breakfast', 170),
('Tuscan Tuna Salad', 'Lunch', 380),
('Turkey/Mint Salad', 'Lunch', 350),
('Ratatouille Salad', 'Lunch', 210),
('Potato/Crn/Pea Salad', 'Lunch', 410),
('Chck/Corn Salad', 'Lunch', 290),
('Cafe Latte', 'Beverages', 240),
('Cafe Mocha', 'Beverages', 460),
('Cappuccino', 'Beverages', 170),
('Earl Grey Tea Latte', 'Beverages', 280),
('Chai Latte', 'Beverages', 310),
('Cider', 'Beverages', 180),
('Vnlla Rooibos Latte', 'Beverages', 330),
('Flavoured Steamer', 'Beverages', 440),
('Green Tea Latte', 'Beverages', 290),
('Hot Chocolate', 'Beverages', 530),
('Caffe Misto', 'Beverages', 20),
('Rooibos Caffe Misto', 'Beverages', 100),
('Tea Misto', 'Beverages', 25),
('Caffe Macchiato', 'Beverages', 35),
('Caffe Con Panna', 'Beverages', 100),
('Cremosa', 'Beverages', 130),
('Italian Soda', 'Beverages', 80),
('Iced Coconut Chai', 'Beverages', 220),
('Real Iced Coffee', 'Beverages', 90),
('Spicy Mexican Mocha', 'Beverages', 510),
('Gingerbread Latte', 'Beverages', 340),
('Rum/Egg Nog Latte', 'Beverages', 380),
('Egg Nog Latte', 'Beverages', 270),
('Five Spice Tea Latte', 'Beverages', 280),
('Candy Cane Hot Choc', 'Beverages', 480),
('Vanilla Cream Frappe', 'Beverages', 330),
('Fruit Cream Frappe', 'Beverages', 270),
('Banana Latte Frappe', 'Beverages', 270),
('Chai Frappe', 'Beverages', 240),
('Frappe Latte', 'Beverages', 230),
('Frappe Latte Caramel', 'Beverages', 250),
('Frappe Mocha', 'Beverages', 340),
('Matcha Frappe', 'Beverages', 260),
('4 Berry Smoothie', 'Beverages', 270),
('Mango Smoothie', 'Beverages', 290),
('Strawberry Smoothie', 'Beverages', 290),
('Tropical Smoothie', 'Beverages', 230),
('Fruit Salad/Yogurt', 'Breakfast', 240),
('Toasted Seed Roll', 'Baked Goods', 470);

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
