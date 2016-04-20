-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 20, 2016 at 02:37 AM
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

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`admin_user`, `pw`, `email`) VALUES
('test', 'test', 'test'),
('test1', 'test1', 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `Contains`
--

CREATE TABLE `Contains` (
  `item_name` varchar(20) NOT NULL,
  `ingredient_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Contains`
--

INSERT INTO `Contains` (`item_name`, `ingredient_name`) VALUES
('Almond Biscotti', 'Egg'),
('Almond Biscotti', 'Milk'),
('Almond Biscotti', 'Tree Nuts'),
('Almond Biscotti', 'Wheat'),
('Apple Cran Crisp', 'Milk'),
('Apple Cran Crisp', 'Oats'),
('Apple Cran Crisp', 'Soy'),
('Apple Cran Crisp', 'Wheat'),
('Banana Latte Frappe', 'Milk'),
('Barley Zucch Muffin', 'Barley'),
('Barley Zucch Muffin', 'Egg'),
('Barley Zucch Muffin', 'Tree Nuts'),
('Beef Stroganoff', 'Meat'),
('Beef Stroganoff', 'Milk'),
('Beef Stroganoff', 'Soy'),
('Black/White Cookie', 'Egg'),
('Black/White Cookie', 'Milk'),
('Black/White Cookie', 'Soy'),
('Black/White Cookie', 'Wheat'),
('Breakfast Panini', 'Egg'),
('Breakfast Panini', 'Meat'),
('Breakfast Panini', 'Milk'),
('Breakfast Panini', 'Sesame'),
('Breakfast Panini', 'Soy'),
('Breakfast Panini', 'Wheat'),
('Broccoli Chs Scone', 'Egg'),
('Broccoli Chs Scone', 'Milk'),
('Broccoli Chs Scone', 'Soy'),
('Broccoli Chs Scone', 'Wheat'),
('Cafe Latte', 'Milk'),
('Cafe Mocha', 'Milk'),
('Caffe Con Panna', 'Milk'),
('Caffe Macchiato', 'Milk'),
('Caffe Misto', 'Milk'),
('Candy Cane Hot Choc', 'Milk'),
('Cappuccino', 'Milk'),
('Caprese Sandwich', 'Barley'),
('Caprese Sandwich', 'Egg'),
('Caprese Sandwich', 'Milk'),
('Caprese Sandwich', 'Wheat'),
('Carrot Cake', 'Egg'),
('Carrot Cake', 'Milk'),
('Carrot Cake', 'Wheat'),
('Chai Frappe', 'Milk'),
('Chai Latte', 'Milk'),
('Chck/Corn Salad', 'Egg'),
('Chck/Corn Salad', 'Meat'),
('Chck/Egg Noodle Soup', 'Egg'),
('Chck/Egg Noodle Soup', 'Meat'),
('Chck/Egg Noodle Soup', 'Soy'),
('Chck/Egg Noodle Soup', 'Wheat'),
('Chddr/Tomato Soup', 'Milk'),
('Chddr/Tomato Soup', 'Soy'),
('Chicken Pot Pie', 'Egg'),
('Chicken Pot Pie', 'Meat'),
('Chicken Pot Pie', 'Milk'),
('Chicken Pot Pie', 'Soy'),
('Chicken Pot Pie', 'Wheat'),
('Choc Banana Loaf', 'Egg'),
('Choc Banana Loaf', 'Milk'),
('Choc Banana Loaf', 'Soy'),
('Choc Banana Loaf', 'Wheat'),
('Choc Chipper Cookie', 'Egg'),
('Choc Chipper Cookie', 'Milk'),
('Choc Chipper Cookie', 'Soy'),
('Choc Chipper Cookie', 'Wheat'),
('Choc Hazelnut Crunch', 'Barley'),
('Choc Hazelnut Crunch', 'Egg'),
('Choc Hazelnut Crunch', 'Milk'),
('Choc Hazelnut Crunch', 'Soy'),
('Choc Hazelnut Crunch', 'Tree Nuts'),
('Choc Hazelnut Crunch', 'Wheat'),
('Choc Zucchini Loaf', 'Egg'),
('Choc Zucchini Loaf', 'Wheat'),
('Cinnamon Roll', 'Egg'),
('Cinnamon Roll', 'Milk'),
('Cinnamon Roll', 'Soy'),
('Cinnamon Roll', 'Wheat'),
('Coconut Macaroons', 'Egg'),
('Coconut Macaroons', 'Soy'),
('Cran Blondies', 'Egg'),
('Cran Blondies', 'Milk'),
('Cran Blondies', 'Soy'),
('Cran Blondies', 'Tree Nuts'),
('Cran Blondies', 'Wheat'),
('Cran Orange Muffin', 'Egg'),
('Cran Orange Muffin', 'Oats'),
('Cran Orange Muffin', 'Wheat'),
('Cremosa', 'Milk'),
('Crm Cauliflower Soup', 'Milk'),
('Crm Cauliflower Soup', 'Soy'),
('Crm Cauliflower Soup', 'Wheat'),
('Date Square', 'Milk'),
('Date Square', 'Oats'),
('Date Square', 'Soy'),
('Date Square', 'Wheat'),
('Earl Grey Cookie', 'Egg'),
('Earl Grey Cookie', 'Milk'),
('Earl Grey Cookie', 'Wheat'),
('Earl Grey Tea Latte', 'Milk'),
('Egg Nog Latte', 'Milk'),
('ff', 'test'),
('Five Spice Tea Latte', 'Milk'),
('Flavoured Steamer', 'Milk'),
('food', 'food'),
('Frappe Latte', 'Milk'),
('Frappe Latte Caramel', 'Milk'),
('Frappe Mocha', 'Milk'),
('Fruit Cream Frappe', 'Milk'),
('Fruit Salad/Yogurt', 'Milk'),
('Gingerbread Latte', 'Milk'),
('Granola Bar', 'Barley'),
('Granola Bar', 'Oats'),
('Granola Bar', 'Tree Nuts'),
('Granola Parfait', 'Barley'),
('Granola Parfait', 'Milk'),
('Granola Parfait', 'Oats'),
('Granola Parfait', 'Tree Nuts'),
('Green Tea Latte', 'Milk'),
('Hello', 'food'),
('hi', 'test'),
('Hot Chocolate', 'Milk'),
('Iced Coconut Chai', 'Milk'),
('Italian Deli Sndwich', 'Barley'),
('Italian Deli Sndwich', 'Egg'),
('Italian Deli Sndwich', 'Meat'),
('Italian Deli Sndwich', 'Milk'),
('Italian Deli Sndwich', 'Wheat'),
('Kale Pesto Flatbread', 'Milk'),
('Kale Pesto Flatbread', 'Wheat'),
('Lentil/Bean Stew', 'Wheat'),
('Mac & Cheese', 'Egg'),
('Mac & Cheese', 'Milk'),
('Mac & Cheese', 'Wheat'),
('Maple Pecan Danish', 'Egg'),
('Maple Pecan Danish', 'Milk'),
('Maple Pecan Danish', 'Tree Nuts'),
('Maple Pecan Danish', 'Wheat'),
('Matcha Frappe', 'Milk'),
('Mediterranean Scone', 'Egg'),
('Mediterranean Scone', 'Milk'),
('Mediterranean Scone', 'Soy'),
('Mediterranean Scone', 'Wheat'),
('Multigrain Toast', 'Barley'),
('Multigrain Toast', 'Oats'),
('Multigrain Toast', 'Soy'),
('Multigrain Toast', 'Wheat'),
('Nuttier PB Cookie', 'Egg'),
('Nuttier PB Cookie', 'Milk'),
('Nuttier PB Cookie', 'Peanuts'),
('Nuttier PB Cookie', 'Wheat'),
('Potato/Crn/Pea Salad', 'Egg'),
('Potato/Crn/Pea Salad', 'Meat'),
('Potato/Crn/Pea Salad', 'Milk'),
('Prairie Chowder', 'Barley'),
('Prairie Chowder', 'Meat'),
('Prairie Chowder', 'Milk'),
('Prairie Chowder', 'Soy'),
('Praline Brownie', 'Egg'),
('Praline Brownie', 'Milk'),
('Praline Brownie', 'Soy'),
('Praline Brownie', 'Tree Nuts'),
('Praline Brownie', 'Wheat'),
('Pumpkin Spice Muffin', 'Oats'),
('Pumpkin Spice Muffin', 'Wheat'),
('Ratatouille Salad', 'Milk'),
('Ratatouille Salad', 'Soy'),
('Rice Krispy Square', 'Barley'),
('Rice Krispy Square', 'Milk'),
('Rice Krispy Square', 'Soy'),
('Rice Krispy Square', 'Wheat'),
('Roast Beef/Arugula', 'Barley'),
('Roast Beef/Arugula', 'Meat'),
('Roast Beef/Arugula', 'Milk'),
('Roast Beef/Arugula', 'Soy'),
('Roast Beef/Arugula', 'Wheat'),
('Rooibos Caffe Misto', 'Milk'),
('Rum/Egg Nog Latte', 'Alcohol'),
('Rum/Egg Nog Latte', 'Milk'),
('Sicilian Flatbread', 'Meat'),
('Sicilian Flatbread', 'Milk'),
('Sicilian Flatbread', 'Wheat'),
('Spicy Mexican Mocha', 'Milk'),
('Splt Pea/Barley Soup', 'Barley'),
('Splt Pea/Barley Soup', 'Soy'),
('Steel Cut Oatmeal', 'Oats'),
('SW Breakfast Bake', 'Egg'),
('SW Breakfast Bake', 'Milk'),
('SW Breakfast Wrap', 'Egg'),
('SW Breakfast Wrap', 'Milk'),
('SW Breakfast Wrap', 'Soy'),
('SW Breakfast Wrap', 'Wheat'),
('Tea Misto', 'Milk'),
('Test', 'test'),
('Toasted Seed Roll', 'Wheat'),
('Turkey/Mint Salad', 'Meat'),
('Turkey/Mint Salad', 'Milk'),
('Turkey/Mint Salad', 'Tree Nuts'),
('Tuscan Tuna Salad', 'Egg'),
('Tuscan Tuna Salad', 'Meat'),
('Tuscan Tuna Salad', 'Soy'),
('Tuscan Tunawich', 'Barley'),
('Tuscan Tunawich', 'Egg'),
('Tuscan Tunawich', 'Meat'),
('Tuscan Tunawich', 'Oats'),
('Tuscan Tunawich', 'Soy'),
('Tuscan Tunawich', 'Wheat'),
('V Berry Bran Muffin', 'Egg'),
('V Berry Bran Muffin', 'Oats'),
('V Berry Bran Muffin', 'Wheat'),
('Vanilla Cream Frappe', 'Milk'),
('Vnlla Rooibos Latte', 'Milk'),
('White Ch/Berry Scone', 'Egg'),
('White Ch/Berry Scone', 'Milk'),
('White Ch/Berry Scone', 'Soy'),
('White Ch/Berry Scone', 'Tree Nuts'),
('White Ch/Berry Scone', 'Wheat'),
('Zingy Ginger Cookie', 'Egg'),
('Zingy Ginger Cookie', 'Milk'),
('Zingy Ginger Cookie', 'Wheat');

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
('test', 'test', 'test', 'test', 'test', 'Country Hills');

-- --------------------------------------------------------

--
-- Table structure for table `Dietary_Restriction`
--

CREATE TABLE `Dietary_Restriction` (
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Dietary_Restriction`
--

INSERT INTO `Dietary_Restriction` (`dr_name`) VALUES
('Adult Only'),
('Celiac''s Disease'),
('Gluten Intolerance'),
('Lactose Intolerance'),
('Low-Calorie'),
('Nut Allergy'),
('Ovo Vegetarianism'),
('Sesame Allergy'),
('Vegan'),
('Vegetarianism');

-- --------------------------------------------------------

--
-- Table structure for table `Favourite`
--

CREATE TABLE `Favourite` (
  `cust_user` varchar(20) NOT NULL,
  `item_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Favourite`
--

INSERT INTO `Favourite` (`cust_user`, `item_name`) VALUES
('test', 'Breakfast Panini'),
('test', 'Ratatouille Salad'),
('test', 'Tea Misto'),
('test', 'Vnlla Rooibos Latte');

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient`
--

CREATE TABLE `Ingredient` (
  `ingredient_name` varchar(20) NOT NULL,
  `calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ingredient`
--

INSERT INTO `Ingredient` (`ingredient_name`, `calories`) VALUES
('Barley', 10),
('Egg', 50),
('Milk', 50),
('Tree Nuts', 50),
('Wheat', 30);

-- --------------------------------------------------------

--
-- Table structure for table `Ingredient_Rest`
--

CREATE TABLE `Ingredient_Rest` (
  `ingredient_name` varchar(20) NOT NULL,
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Ingredient_Rest`
--

INSERT INTO `Ingredient_Rest` (`ingredient_name`, `dr_name`) VALUES
('Alcohol', 'Adult Only'),
('Barley', 'Celiac''s Disease'),
('Barley', 'Gluten Intolerance'),
('Egg', 'Ovo Vegetarianism'),
('Egg', 'Vegan'),
('Gelatin', 'Vegan'),
('Meat', 'Vegan'),
('Meat', 'Vegetarianism'),
('Milk', 'Lactose Intolerance'),
('Milk', 'Vegan'),
('Oats', 'Celiac''s Disease'),
('Oats', 'Gluten Intolerance'),
('Peanuts', 'Nut Allergy'),
('Sesame', 'Sesame Allergy'),
('Soy', 'Celiac''s Disease'),
('Tree Nuts', 'Nut Allergy'),
('Wheat', 'Celiac''s Disease'),
('Wheat', 'Gluten Intolerance');

-- --------------------------------------------------------

--
-- Table structure for table `Menu_item`
--

CREATE TABLE `Menu_item` (
  `item_name` varchar(20) NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `total_calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Menu_item`
--

INSERT INTO `Menu_item` (`item_name`, `meal_type`, `total_calories`) VALUES
('4 Berry Smoothie', 'Beverages', 270),
('44', '44', 33),
('Almond Biscotti', 'Dessert', 210),
('Apple Cran Crisp', 'Dessert', 270),
('Banana Latte Frappe', 'Beverages', 270),
('Barley Zucch Muffin', 'Dessert', 300),
('Beef Stroganoff', 'Lunch', 470),
('Black/White Cookie', 'Dessert', 200),
('Breakfast Panini', 'Breakfast', 560),
('Broccoli Chs Scone', 'Dessert', 300),
('Cafe Latte', 'Beverages', 240),
('Cafe Mocha', 'Beverages', 460),
('Caffe Con Panna', 'Beverages', 100),
('Caffe Macchiato', 'Beverages', 35),
('Caffe Misto', 'Beverages', 20),
('Candy Cane Hot Choc', 'Beverages', 480),
('Cappuccino', 'Beverages', 170),
('Caprese Sandwich', 'Lunch', 510),
('Carrot Cake', 'Dessert', 420),
('Chai Frappe', 'Beverages', 240),
('Chai Latte', 'Beverages', 310),
('Chck/Corn Salad', 'Lunch', 290),
('Chck/Egg Noodle Soup', 'Lunch', 200),
('Chddr/Tomato Soup', 'Lunch', 320),
('Chicken Pot Pie', 'Lunch', 520),
('Choc Banana Loaf', 'Dessert', 320),
('Choc Chipper Cookie', 'Dessert', 210),
('Choc Hazelnut Crunch', 'Dessert', 460),
('Choc Zucchini Loaf', 'Dessert', 260),
('Cider', 'Beverages', 180),
('Cinnamon Roll', 'Dessert', 440),
('Coconut Macaroons', 'Dessert', 120),
('Cran Blondies', 'Dessert', 280),
('Cran Orange Muffin', 'Dessert', 330),
('Cremosa', 'Beverages', 130),
('Crm Cauliflower Soup', 'Lunch', 400),
('Date Square', 'Dessert', 420),
('Earl Grey Cookie', 'Dessert', 240),
('Earl Grey Tea Latte', 'Beverages', 280),
('Egg Nog Latte', 'Beverages', 270),
('ff', 'ff', 2),
('Five Spice Tea Latte', 'Beverages', 280),
('Flavoured Steamer', 'Beverages', 440),
('food', 'breakfast', 33),
('Frappe Latte', 'Beverages', 230),
('Frappe Latte Caramel', 'Beverages', 250),
('Frappe Mocha', 'Beverages', 340),
('Fruit Cream Frappe', 'Beverages', 270),
('Fruit Salad', 'Breakfast', 170),
('Fruit Salad/Yogurt', 'Breakfast', 240),
('Gingerbread Latte', 'Beverages', 340),
('Granola Bar', 'Dessert', 390),
('Granola Parfait', 'Breakfast', 640),
('Green Tea Latte', 'Beverages', 290),
('Hello', 'Hi', 33),
('hi', 'breakfast', 3),
('Hot Chocolate', 'Beverages', 530),
('Iced Coconut Chai', 'Beverages', 220),
('Italian Deli Sndwich', 'Lunch', 600),
('Italian Soda', 'Beverages', 80),
('Kale Pesto Flatbread', 'Lunch', 290),
('Lentil/Bean Stew', 'Lunch', 350),
('Mac & Cheese', 'Lunch', 580),
('Mango Smoothie', 'Beverages', 290),
('Maple Pecan Danish', 'Dessert', 400),
('Matcha Frappe', 'Beverages', 260),
('Mediterranean Scone', 'Dessert', 300),
('Minestrone Soup', 'Lunch', 130),
('Multigrain Toast', 'Breakfast', 90),
('Nuttier PB Cookie', 'Dessert', 210),
('Potato/Crn/Pea Salad', 'Lunch', 410),
('Prairie Chowder', 'Lunch', 570),
('Praline Brownie', 'Dessert', 430),
('Pumpkin Spice Muffin', 'Dessert', 420),
('Ratatouille Salad', 'Lunch', 210),
('Real Iced Coffee', 'Beverages', 90),
('Rice Krispy Square', 'Dessert', 330),
('Roast Beef/Arugula', 'Lunch', 590),
('Rooibos Caffe Misto', 'Beverages', 100),
('Rum/Egg Nog Latte', 'Beverages', 380),
('Sicilian Flatbread', 'Lunch', 290),
('Spicy Mexican Mocha', 'Beverages', 510),
('Splt Pea/Barley Soup', 'Lunch', 260),
('Steel Cut Oatmeal', 'Breakfast', 170),
('Strawberry Smoothie', 'Beverages', 290),
('SW Breakfast Bake', 'Breakfast', 230),
('SW Breakfast Wrap', 'Breakfast', 420),
('Tea Misto', 'Beverages', 25),
('Test', 'Dessert', 2),
('Toasted Seed Roll', 'Dessert', 470),
('Tropical Smoothie', 'Beverages', 230),
('Turkey/Mint Salad', 'Lunch', 350),
('Tuscan Tuna Salad', 'Lunch', 380),
('Tuscan Tunawich', 'Lunch', 340),
('V Berry Bran Muffin', 'Dessert', 380),
('Vanilla Cream Frappe', 'Beverages', 330),
('Vnlla Rooibos Latte', 'Beverages', 330),
('White Ch/Berry Scone', 'Dessert', 330),
('Zingy Ginger Cookie', 'Dessert', 210);

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

--
-- Dumping data for table `Serves`
--

INSERT INTO `Serves` (`restaurant_id`, `item_name`) VALUES
('456', 'Almond Biscotti');

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
('456', 'test', 'Country Hills');

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
