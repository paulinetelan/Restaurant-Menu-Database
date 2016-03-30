<?php

/*
	Actual library functions that get data
	contains queries to database
*/
	function getCustomers()
	{
		// Initialize array that will contain all data
		$array = array();
		
		// Loop that populates array with data
		for ($i = 0; $i < 5; $i++)
		{
			//Each userObjects = one user
			$userObject = array(); // dictionary for one user
			
			$userObject["username"] = $i;
			$userObject["fname"] = "User ".$i;
			$userObject["lname"] = "LUser ".$i;
			$userObject["password"] = "PUser ".$i;
			$userObject["email"] = "EUser ".$i;
			
			// add user to array
			$array[] = $userObject;
		}
		return $array;
	}

	// adds customer to database
	function addCustomer($fname, $lname, $uname, $pw, $email)
	{
		return true;
	}


?>