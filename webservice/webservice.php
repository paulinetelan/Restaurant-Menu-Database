/**
This php document returns data in JSON format
**/

<?php

	// Include library that returns the data or execute the required methods
	include("./library.php"); 

	// CHECK REQUEST
	// Check the method requested by site and execute
	$method = $_GET["method"];
	if($method == "getCustomers"){
		   json_getCustomers();
	}
	else if($method == "addCustomer"){
	     json_addCustomer($_GET["fname"], $_GET["lname"], $_GET["uname"], $_GET["pw"], $_GET["email"]);
	}

	// WEBSERVICE METHODS

	function json_getCustomers(){
		 $output = array();
		 $output["success"] = true;
		 $output["message"] = "Customer list fetched successfully";
		 $output["data"] = getCustomers();
		 echo json_encode($output);
	}

	function json_addCustomer($fname, $lname, $uname, $pw, $email){
		 
		 $valid = true;
		 $message = "Customer added successfully";

		 // Check if input values are taken
		 if(!isset($fname) || !isset($lname) || !isset($uname) || !isset($pw) ||
		 !isset($email) ){
		 		$valid = false;
				$message = "Invalid input values";
		 }

		 // Add user using library method
		 if($valid)
		 {
			$valid = addCustomer($fname, $lname, $uname, $pw, $email);
			if(!$valid){
				$message = "Something went wrong with insertion process";
			}
		 }

		 $output = array();
		 $output["success"] = $valid;
		 $output["message"] = $message;
		 echo json_encode($output);
	}

?>