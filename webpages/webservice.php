<?php 
      
/**
This php document returns data in JSON format
**/
	header('Content-Type: application/json');

	// Include library that returns the data or execute the required methods
	include("./library.php"); 
	
	// Start session
	session_start();

	// CHECK REQUEST
	// Check the method requested by site and execute
	$method = $_GET["method"];

	if($method == "getCustomers"){
		   json_getCustomers();
	}

	else if($method == "addCustomer"){
	     json_addCustomer($_GET["uname"], $_GET["pw"], $_GET["fname"], $_GET["lname"], $_GET["email"], $_GET["branch_name"]);
	}

	else if($method == "getBranches"){
	     json_getBranches();
	}

	else if($method == "customerLogin"){
	     json_customerLogin($_GET["uname"], $_GET["pw"]);
	}

	else if($method == "adminLogin"){
	     json_adminLogin($_GET["uname"], $_GET["pw"]);
	}

	else if($method == "loadCustomerMenu"){
	     json_loadCustomerMenu($_GET["res"]);
	}

	else if($method == "loadIngredients"){
	     json_loadIngredients();
	}

	else if($method == "addIngredient"){
	     json_addIngredient($_GET["name"], $_GET["calories"]);
	}

	else if($method == "addFoodItem"){
	     json_addFoodItem($_GET["name"], $_GET["mealType"], $_GET["ingredients"], $_GET["totalCalories"]);
	}

	else if($method == "killsession"){
	     json_killsession();
	}

	else if($method == "saveFavourites"){
	     json_saveFavourites($_GET["favourites"]);
	}

	else if($method == "getFavourites"){
	     json_getFavourites();
	}

	else{
		 $output = array();
		 $output["success"] = false;
		 $output["message"] = "Invalid method";
		 echo json_encode($output);
	}
	

	/////// WEBSERVICE METHODS ///////////

	// gets customer favourites
	function json_getFavourites(){
		 // retrieve username
		 if (isset($_SESSION['username'])) {
			 $uname = $_SESSION['username'];

			 $output["data"] = getFavourites($uname);
			 $output["message"] = "Favourites successfully fetched";
			 $output["success"] = true;
		 } else {
			 $output["message"] = "Not logged in";
			 $output["success"] = false;
		 }
		 echo json_encode($output);
	}

	// takes an array of favourites and saves favourites under customer name
	function json_saveFavourites($faves){
		 // retrieve username
		 if (isset($_SESSION['username'])) {
			 $uname = $_SESSION['username'];

			 $output = array();
			 $output["success"] = saveFavourites($uname, $faves);
			 $output["message"] = "Favourites save unsuccessful!";
			 if($output["success"])
				$output["message"] = "Favourites saved successfully";
			echo json_encode($output);
		 } else {
			 $output["message"] = "Not logged in";
			 $output["success"] = false;
		 }
		 
	}


	function json_getCustomers(){
		 $output = array();
		 $output["success"] = true;
		 $output["message"] = "Customer list fetched successfully";
		 $output["data"] = getCustomers();
		 echo json_encode($output);
	}

	// gets branches
	function json_getBranches(){
		 $output = array();
		 $output["success"] = true;
		 $output["message"] = "List of branches fetched successfully";
		 $output["data"] = getBranches();
		 echo json_encode($output);
	}

	function json_addCustomer($uname, $pw, $fname, $lname, $email, $branch_name){
		 
		 $valid = true;
		 $message = "Customer added successfully";

		 // Check if input values are taken
		 if(!isset($fname) || !isset($lname) || !isset($uname) || !isset($pw) ||
		 !isset($email) || !isset($branch_name)){
		 		$valid = false;
				$message = "Invalid input values";
		 }

		 // Add user using library method
		 if($valid)
		 {
			$valid = addCustomer($uname, $pw, $fname, $lname, $email, $branch_name);
			if(!$valid){
				$message = "Username is already taken!";
			}
		 }

		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 echo json_encode($output);
	}

	// checks Customer table for login credentials
	// returns data as true or false depending if uname and pw match
	function json_customerLogin($uname, $pw)
	{
		$valid = true;
		$message = "Customer logged in successfully";
		
		// Check if input values are taken
		 if(!isset($uname) || !isset($pw)){
		 		$valid = false;
				$message = "Invalid input values";
		 }

		 // check user login credentials
		 if($valid){
		 	$valid = customerLogin($uname, $pw);
			if(!$valid){
				
				$message = "Customer log in failed!";
			}
			else{
				// start session 
				$_SESSION['username'] = $uname;
			}
		 }

		 
		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 $output["sid"] = htmlspecialchars(session_id());
		 echo json_encode($output);
	}

	// checks Admin table for login credentials
	// returns data as true or false depending if uname and pw match
	function json_adminLogin($uname, $pw)
	{
		$valid = true;
		$message = "Admin logged in successfully";
		
		// Check if input values are taken
		 if(!isset($uname) || !isset($pw)){
		 		$valid = false;
				$message = "Invalid input values";
		 }

		 // check user login credentials
		 if($valid){
		 	$valid = adminLogin($uname, $pw);
			if(!$valid){
				
				$message = "Admin log in failed!";
			}
			else{
				// start session 
				$_SESSION['username'] = $uname;
				$_SESSION['admin'] = true; // set flag in session that we are admin
			}
		 }

		 
		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 $output["sid"] = htmlspecialchars(session_id());
		 echo json_encode($output);
	}

	

	// fetches menu based on user from session id
	function json_loadCustomerMenu($restrictions)
	{
		// get username
		if (isset($_SESSION['username'])) {
			$uname = $_SESSION['username'];

			// get data from database
			$output = array();
			$output["menu"] = loadCustomerMenu($uname, $restrictions);
			$output["fname"] = getFname($uname);
			
			echo json_encode($output);
		} else {
			$output["message"] = "Not logged in";
			$output["success"] = false;
		}
	}

	// fetches ingredients
	function json_loadIngredients()
	{
		// get data from database
		$output = array();
		$output["ingredients"] = loadIngredients();
		
		echo json_encode($output);
	}

	function json_addIngredient($name, $calories){
		 
		 $valid = false;
		 $message = "Not authorized";

		 // Check that logged in user is admin
		 if (isset($_SESSION['admin']))
		 {
			$valid = addIngredient($name, $calories);
			$message = "Ingredient added successfully";
			if(!$valid){
				$message = "Unable to add ingredient";
			}
		 }

		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 echo json_encode($output);
	}

	function json_addFoodItem($name, $mealType, $ingredients, $totalCalories){
		 
		 $valid = false;
		 $message = "Not authorized";

		 // Check that logged in user is admin
		 if (isset($_SESSION['admin']))
		 {
			$valid = addFoodItem($name, $mealType, $ingredients, $totalCalories);
			$message = "Food item added successfully";
			if(!$valid){
				$message = "Unable to add food item";
			}
		 }

		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 echo json_encode($output);
	}

	//Note: some code taken from http://php.net/manual/en/function.session-destroy.php
	function json_killsession(){
		 // unset all session var
		 $_SESSION = array();

		 // destroy cookies
		 if (ini_get("session.use_cookies")) {
    		    $params = session_get_cookie_params();
    		    setcookie(session_name(), '', time() - 42000,
        	    $params["path"], $params["domain"],
        	    $params["secure"], $params["httponly"]
    		    );
		    }

		session_destroy();  
	
	}

?>
