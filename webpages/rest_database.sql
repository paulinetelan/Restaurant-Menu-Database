----
-- phpLiteAdmin database dump (http://phpliteadmin.googlecode.com)
-- phpLiteAdmin version: 1.9.5
-- Exported: 5:37am on April 1, 2016 (CEST)
-- database file: /Applications/MAMP/db/sqlite/471project
----
BEGIN TRANSACTION;

----
-- Table structure for Customer
----
CREATE TABLE 'Customer' ('uname' TEXT PRIMARY KEY NOT NULL, 'pw' TEXT, 'fname' TEXT, 'lname' TEXT, 'email' TEXT);

----
-- Data dump for Customer, a total of 0 rows
----

----
-- Table structure for Admin
----
CREATE TABLE 'Admin' ('admin_user' TEXT PRIMARY KEY NOT NULL, 'pw' TEXT, 'email' TEXT);

----
-- Data dump for Admin, a total of 0 rows
----

----
-- Table structure for Menu_item
----
CREATE TABLE 'Menu_item' ('item_name' TEXT PRIMARY KEY NOT NULL, 'meal_type' TEXT, 'total_calories' INTEGER);

----
-- Data dump for Menu_item, a total of 0 rows
----

----
-- Table structure for Serves
----
CREATE TABLE 'Serves' ('restaurant_id' TEXT NOT NULL, 'item_name' TEXT NOT NULL, PRIMARY KEY ('restaurant_id', 'item_name'));

----
-- Data dump for Serves, a total of 0 rows
----

----
-- Table structure for Store
----
CREATE TABLE 'Store' ('restaurant_id' TEXT PRIMARY KEY NOT NULL, 'admin_user' TEXT NOT NULL, 'name' TEXT);

----
-- Data dump for Store, a total of 0 rows
----

----
-- Table structure for Ingredient
----
CREATE TABLE 'Ingredient' ('ingredient_name' TEXT PRIMARY KEY NOT NULL, 'total_calories' INTEGER);

----
-- Data dump for Ingredient, a total of 0 rows
----

----
-- Table structure for Dietary_Restriction
----
CREATE TABLE 'Dietary_Restriction' ('dr_name' TEXT PRIMARY KEY NOT NULL);

----
-- Data dump for Dietary_Restriction, a total of 0 rows
----

----
-- Table structure for Favourite
----
CREATE TABLE 'Favourite' ('cust_user' TEXT NOT NULL, 'item_name' TEXT NOT NULL, PRIMARY KEY ('cust_user', 'item_name'));

----
-- Data dump for Favourite, a total of 0 rows
----

----
-- Table structure for Contains
----
CREATE TABLE 'Contains' ('item_name' TEXT NOT NULL, 'ingredient_name' TEXT NOT NULL, PRIMARY KEY ('item_name', 'ingredient_name'));

----
-- Data dump for Contains, a total of 0 rows
----

----
-- Table structure for Restricted_by
----
CREATE TABLE 'Restricted_by' ('cust_user' TEXT NOT NULL, 'dr_name' TEXT NOT NULL, PRIMARY KEY ('cust_user', 'dr_name'));

----
-- Data dump for Restricted_by, a total of 0 rows
----

----
-- Table structure for Ingr_Has_Rest
----
CREATE TABLE 'Ingr_Has_Rest' ('ingredient_name' TEXT NOT NULL, 'dr_name' TEXT NOT NULL, PRIMARY KEY ('ingredient_name', 'dr_name'));

----
-- Data dump for Ingr_Has_Rest, a total of 0 rows
----

----
-- structure for index sqlite_autoindex_Customer_1 on table Customer
----
;

----
-- structure for index sqlite_autoindex_Admin_1 on table Admin
----
;

----
-- structure for index sqlite_autoindex_Menu_item_1 on table Menu_item
----
;

----
-- structure for index sqlite_autoindex_Serves_1 on table Serves
----
;

----
-- structure for index sqlite_autoindex_Store_1 on table Store
----
;

----
-- structure for index sqlite_autoindex_Ingredient_1 on table Ingredient
----
;

----
-- structure for index sqlite_autoindex_Dietary_Restriction_1 on table Dietary_Restriction
----
;

----
-- structure for index sqlite_autoindex_Favourite_1 on table Favourite
----
;

----
-- structure for index sqlite_autoindex_Contains_1 on table Contains
----
;

----
-- structure for index sqlite_autoindex_Restricted_by_1 on table Restricted_by
----
;

----
-- structure for index sqlite_autoindex_Ingr_Has_Rest_1 on table Ingr_Has_Rest
----
;
COMMIT;
