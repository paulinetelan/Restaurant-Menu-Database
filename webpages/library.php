<?php

/*
	Actual library functions that get data
	contains queries to database
*/

	$HOST = "localhost";
	$C_USER = "root";
	$C_PASSWORD = "1234";
	$C_DATABASE = "rest_database";

	$link = mysqli_connect($C_HOST, $C_USER, $C_PASSWORD, $C_DATABASE);
	if (!$link)
	{
		echo mysqli_connect_error();
	}

	//////////// FUNCTIONS ///////////////////

	function getCustomers()
	{
		// Initialize array that will contain all data
		$array = array();
		
		//SQL statement
		$sql = "SELECT DISTINCT fname, lname FROM Customer";

		// execute sql statement
		global $link;
		$results = mysqli_query($link, $sql);

		// retrieve rows returned
		while ($row = mysqli_fetch_row($results))
		{
			// each object represents one user
			$object = array(); // used as a dictionary (fname, lname)

			$object["fname"] = $row[0];
			$object["lname"] = $row[1];

			// add user to array
			$array[] = $object;
		}
		return $array;
	}

	// adds customer to database and returns true if successful
	function addCustomer($fname, $lname, $uname, $pw, $email)
	{
		global $link;

		// escape special characters to avoid sql injection
		$name =  mysqli_real_escape_string($link, $fname, $lname, $uname, $pw, $email);

		// create sql statement
		$sql = "INSERT INTO Customer(uname, pw, fname, lname, email) VALUES ($uname, $pw, $fname, $lname, $email)";
		echo $sql;

		// execute sql statement
		$results = mysqli_query($link, $sql);

		return true;
	}


?>