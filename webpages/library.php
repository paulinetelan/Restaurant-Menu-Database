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
	function addCustomer($uname, $pw, $fname, $lname, $email, $branch_name)
	{
		global $link;
		
		
		// check if username exists in db
		$sqlcheck = $link->prepare("SELECT * FROM Customer WHERE Customer.uname = ?");
		$sqlcheck->bind_param("s", $uname);
		$sqlcheck->execute();
		$sqlcheck->store_result();

		// if username exists
		if($sqlcheck->num_rows != 0){
			   return false;
		}
		else // add customer
		{
			// create sql statement
			$sql = $link->prepare("INSERT INTO Customer(uname, pw, fname, lname, email, branch_name) VALUES (?, ?, ?, ?, ?, ?)");
			$sql->bind_param("ssssss", $uname, $pw, $fname, $lname, $email, $branch_name);

			// execute sql statement
			$sql->execute();

			return true;
		}
	}

	// returns true iff uname and pw combo matches one in db
	function customerLogin($uname, $pw)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("SELECT Customer.pw FROM Customer WHERE Customer.uname = ? AND Customer.pw = ?");
		$sql->bind_param('ss', $uname, $pw);
		$sql->execute();
		$sql->store_result();

		// check
		if($sql->num_rows == 1)
		{	
			return true;
		}

		return false;
		
		
	}

	// returns food item tuples
	function loadCustomerMenu($uname)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("SELECT * FROM Menu_item");
		//$sql->bind_param('s', $uname);
		$sql->execute();
		$sql->store_result();
		$sql->bind_result($item_name, $meal_type, $total_calories);

		// init return array
		$output = array();

		// get data
		while($sql->fetch())
		{
			// each tuple is [item_name, meal_type, total_calories]
			$obj = array();
			$obj['name'] = $item_name;
			$obj['type'] = $meal_type;
			$obj['calories'] = $total_calories;
			
			$output[] = $obj;
		}

		return $output;
		
	}

	// returns first name of customer from uname
	function getFname($uname)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("SELECT Customer.fname FROM Customer Where Customer.uname = ?");
		$sql->bind_param('s', $uname);		    
		$sql->execute();
		$sql->store_result();
		$sql->bind_result($fname);

		if($sql->fetch()){
			return $fname;
		}else{
			
		}
	}

?>