-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2016 at 06:55 PM
-- Server version: 5.5.41-log
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `DataEntry`
--

-- --------------------------------------------------------

--
-- Table structure for table `dietary_restriction`
--

CREATE TABLE IF NOT EXISTS `dietary_restriction` (
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dietary_restriction`
--

INSERT INTO `dietary_restriction` (`dr_name`) VALUES
('Celiac''s Disease'),
('Lactose Intolerance'),
('Gluten Intolerance'),
('Vegan'),
('Vegetarian'),
('Low-Calorie'),
('Nut Allergy'),
('Ovo Vegetarianism');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_rest`
--

CREATE TABLE IF NOT EXISTS `ingredient_rest` (
  `ingredient_name` varchar(20) NOT NULL,
  `dr_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredient_rest`
--

INSERT INTO `ingredient_rest` (`ingredient_name`, `dr_name`) VALUES
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
-- Table structure for table `menu_item`
--

CREATE TABLE IF NOT EXISTS `menu_item` (
  `item_name` varchar(20) NOT NULL,
  `meal_type` varchar(20) NOT NULL,
  `total_calories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`item_name`, `meal_type`, `total_calories`) VALUES
('Very Berry Bran Muff', 'Baked Goods', 380),
('Pumpkin Spice Muffin', 'Baked Goods', 420),
('Barley Zucchini Muff', 'Baked Goods', 300),
('Cranberry Orange Muf', 'Baked Goods', 330),
('Barley Zucchini Muff', 'Baked Goods', 300),
('Cranberry Orange Muf', 'Baked Goods', 330),
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
