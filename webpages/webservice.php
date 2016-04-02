<?php 
      
/**
This php document returns data in JSON format
**/
	header('Content-Type: application/json');

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

	else if($method == "getBranches"){
	     json_getBranches();
	}
	

	/////// WEBSERVICE METHODS ///////////

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

	function json_addCustomer($fname, $lname, $uname, $pw, $email, $branch_name){
		 
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
			$valid = addCustomer($fname, $lname, $uname, $pw, $email, $branch_name);
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