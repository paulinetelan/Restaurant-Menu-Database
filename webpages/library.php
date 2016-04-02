<?php

/*
	Actual library functions that get data
	contains queries to database
*/

	$C_HOST = "localhost";
	$C_USER = "root";
	$C_PASSWORD = "root";
	$C_DATABASE = "471db";
	$C_PORT = 8889;

	$link = new mysqli("$C_HOST", $C_USER, $C_PASSWORD, $C_DATABASE, $C_PORT);
	if ($link->connect_errno)
	{
		echo $mysqli->connect_error();
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
		
		// get rows
		if($result = $link->query($sql))
		{
			// get individual row
			while($obj = $result->fetch_object()){
				   $info = array();
				   $info["fname"] = $obj->fname;
				   $info["lname"] = $obj->lname;
				   $array[] = $info;
			}
		}		
		
		//clean up
		$result->close();
		unset($obj); 
    		unset($sql); 
    		unset($query); 

		return $array;
	}

	// get list of branch names from database return true if successful
	function getBranches()
	{
		global $link;

		// SQL statement
		$sql = "SELECT DISTINCT restaurant_name FROM Store";

		// execute sql statement
		global $link;
		
		// get rows
		if($result = $link->query($sql))
		{
			// get individual row
			while($obj = $result->fetch_object()){ 
				   $array[] = $obj->restaurant_name;
			}
		}		
		
		//clean up
		$result->close();
		unset($obj); 
    		unset($sql); 
    		unset($query); 

		return $array;

	}


	// adds customer to database and returns true if successful
	function addCustomer($fname, $lname, $uname, $pw, $email, $branch_name)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("INSERT INTO Customer(uname, pw, fname, lname, email, branch_name) VALUES (?, ?, ?, ?, ?, ?)");
		$sql->bind_param('ssssss', $uname, $pw, $fname, $lname, $email, $branch_name);

		// execute sql statement
		$sql->execute();

		return true;
	}

?>