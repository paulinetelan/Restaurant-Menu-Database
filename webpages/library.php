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

	// enable strict type checking
	// e.g. inserting string to int column will trigger error
	$link->query('set @@GLOBAL.sql_mode  = "STRICT_ALL_TABLES"');

	//////////// FUNCTIONS ///////////////////

	// gets list of branch names owned by admin username
	function getAdminBranchlist($uname){
		 
		 global $link;

		// SQL statement
		$sql = $link->prepare("SELECT DISTINCT restaurant_name FROM Store WHERE admin_user=?");
		$sql->bind_param("s", $uname);
		$sql->execute();
		$sql->store_result();
		$sql->bind_result($bname);
		
		// init array of branchnames
		$output = array();
		
		while($sql->fetch()){
			$output[] = $bname;
		}

		return $output;

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

		// returns true iff uname and pw combo matches one in db
	function adminLogin($uname, $pw)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("SELECT Admin.pw FROM Admin WHERE Admin.admin_user = ? AND Admin.pw = ?");
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
	function loadCustomerMenu($uname, $user_restrictions)
	{
		global $link;

		// query for restrictions
		$rest = $link->prepare("SELECT m.item_name,  r.dr_name FROM Menu_item m, Contains c, Ingredient_Rest r WHERE m.item_name = c.item_name AND c.ingredient_name = r.ingredient_name");
		$rest->execute();
		$rest->store_result();
		$rest->bind_result($item, $restriction);

		// query for all items
		$sql = $link->prepare("SELECT m.item_name, m.meal_type, m.total_calories FROM Menu_item m");
		//$sql->bind_param('s', $uname);
		$sql->execute();
		$sql->store_result();
		$sql->bind_result($item_name, $meal_type, $total_calories);

		// init return array
		$output = array();

	
		// get restrictions for each item
		$restrictionlist = array();
		while($rest->fetch())
		{
			if($user_restrictions != -1 && in_array($restriction, $user_restrictions)){
				$restrictionlist[$item] = array();
				$restrictionlist[$item][] = "-1";
			}

			// make sure restriction is not in user specified restrictions
			else{
				if(!array_key_exists($item, $restrictionlist)){
				$restrictionlist[$item] = array();
				$restrictionlist[$item][] = $restriction;
				}
				else{
				// make sure no duplicates
				if(!in_array("-1", $restrictionlist[$item]) && !in_array($restriction, $restrictionlist[$item])){
				$restrictionlist[$item][] = $restriction;
				}
				}
						
			
			}
		}
 		

		// get data
		while($sql->fetch())
		{
			// skip item if it has restriction
			if(!array_key_exists($item_name, $restrictionlist) || !in_array(-1, $restrictionlist[$item_name]))
			{
				$obj = array();
				// each tuple is [item_name, meal_type, total_calories, restriction]
				$obj['name'] = $item_name;
				$obj['type'] = $meal_type;
				$obj['calories'] = $total_calories;
				$obj['restrictions'] = array();
			
				if(array_key_exists($item_name, $restrictionlist)){	
					$obj['restrictions'] = $restrictionlist[$item_name];
				}
				$output[] = $obj;
			}
		}

		return $output;
		
	}

	// returns ingredient tuples
	function loadIngredients()
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("SELECT * FROM Ingredient");
		$sql->execute();
		$sql->store_result();
		$sql->bind_result($ingredient_name, $calories);

		// init return array
		$output = array();

		// get data
		while($sql->fetch())
		{
			// each tuple is [item_name, meal_type, total_calories]
			$obj = array();
			$obj['name'] = $ingredient_name;
			$obj['calories'] = $calories;
			
			$output[] = $obj;
		}

		return $output;
		
	}

	// gets customer favourites
	function getFavourites($uname){
		 
		 global $link;
		
		// get favourites
		 $sql = $link->prepare("SELECT f.item_name, m.total_calories FROM Favourite f, Menu_item m WHERE f.item_name = m.item_name AND f.cust_user = ?");
		 $sql->bind_param("s", $uname);
		 $success = $sql->execute();
		 $sql->store_result();
		 $sql->bind_result($item_name, $total_calories);
		 
		 if($success)
		 {
			// get restrictions of favourites
		 	$rest = $link->prepare("SELECT f.item_name, r.dr_name FROM Favourite f, Contains c, Ingredient_Rest r WHERE f.item_name = c.item_name AND c.ingredient_name = r.ingredient_name  AND f.cust_user = ?");
		 	$rest->bind_param("s", $uname);
		 	$success = $rest->execute();
			$rest->store_result();
		 	$rest->bind_result($item, $restriction);

			// store restrictions in list 
			$restrictionlist = array();
			while($rest->fetch())
			{
				if(!array_key_exists($item, $restrictionlist)){
				  	$restrictionlist[$item] = array();
					$restrictionlist[$item][] = $restriction;
				}
				else{
					// check if restriction already exists to avoid duplicates
					if(!in_array($restriction, $restrictionlist[$item]))
						$restrictionlist[$item][] = $restriction;
				}
			
			}

			// init output 
			$output = array();

			// get data
			while($sql->fetch())
			{
		
				$obj = array();
				// each tuple is [item_name, meal_type, total_calories, restriction]
				$obj['name'] = $item_name;
				$obj['calories'] = $total_calories;
				$obj['restrictions'] = array();
			
				// check if restrictions exist for item
				if(array_key_exists($item_name, $restrictionlist)){	
					$obj['restrictions'] = $restrictionlist[$item_name];
				}
				
				// add obj to array
				$output[] = $obj;
			}

				
		}
		return $output;
	}
	
	// adds customer favourites and returns true if successful
	// takes customer username and array of favourites
	function saveFavourites($uname, $favourites){
		 
		 global $link;

		 // insert one record in Favourites for each item
		 for($i = 0; $i < sizeof($favourites); $i++)
		 {
			// create sql statement
		 	$sql = $link->prepare("INSERT INTO Favourite(cust_user, item_name) VALUES(?, ?) ");
		 	$sql->bind_param("ss", $uname, $favourites[$i]);
			$success = $sql->execute();
			if(!$success)
			{
				return $success;
			}
		 }
		 
		 return $success;

	}


	// adds ingredient to database and returns true if successful
	function addIngredient($name, $calories)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("INSERT INTO Ingredient(ingredient_name, calories) VALUES (?, ?)");
		$sql->bind_param("ss", $name, $calories);

		// execute sql statement
		// the DBMS will check if the primary key exists and if the calories is an integer
		return $sql->execute(); // will return whether it succeeded
	}

	// adds food item to database and returns true if successful
	function addFoodItem($name, $mealType, $ingredients, $totalCalories)
	{
		global $link;

		// create sql statement
		$sql = $link->prepare("INSERT INTO menu_item(item_name, meal_type, total_calories) VALUES (?,?,?)");
		$sql->bind_param("sss", $name, $mealType, $totalCalories);

		// execute sql statement
		// the DBMS will check if the primary key exists and if the calories is an integer
		if (!$sql->execute()) return false;

		// insert all of the relationships for the ingredients
		foreach ($ingredients as $i) {
			$sql = $link->prepare("INSERT INTO contains (item_name, ingredient_name) VALUES (?,?)");
			$sql->bind_param("ss", $name, $i);

			// execute and check error
			if (!$sql->execute()) return false;
		}

		// successful
		return true;
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
		}
	}

	// adds branch to db, returns true if successful
	function addBranch($uname, $bname, $bid){
		 global $link;

		$sql = $link->prepare("INSERT INTO Store(restaurant_id, admin_user, restaurant_name) VALUES(?, ?, ?)");
		$sql->bind_param("sss", $bid, $uname, $bname);
		if(!$sql->execute())
			return false;
		$sql->store_result();
		return true;
	}

?>
