// INCLUDES ALL JAVASCRIPT FUNCTIONS FOR WEBSITE

// WEBSERVICE URL
var WS_url = "webservice.php/";

// TODO: fetch ingredient names from database and load it with checkbox list 
function loadIngredients(){
    var br = document.createElement("br");

    // Create list of ingredients with checkbox
    for (var i = 0; i < 5; i++){
	var checkbox = document.createElement("input");
	var description = document.createTextNode(i);
	var label = document.createElement("label");
	checkbox.type = "checkbox";
	checkbox.name = "name";
	checkbox.value = i;

	label.appendChild(checkbox);
	label.appendChild(description);

	document.getElementById("listOfIngredients").appendChild(label);

	    <!-- create new textbox in new line not working? -->
	    document.getElementById("listOfIngredients").appendChild(br);
	document.getElementById("listOfIngredients").appendChild(br);
    }

    
    alert("One or more of the required fields is invalid!");
    return;


}


// add customer to database
function addCustomer()
{

    // Get the fields needed
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var uname = $("#username").val();
    var pw = $("#password").val();
    var email = $("#email").val();
    var branch_name = $("#branchlist").val();

    // check for valid inputs
    if( fname == ""|| fname == null,  lname == "" || lname == null,  uname == ""|| uname == null,  pw == ""|| pw == null,  email == "" || email == null || branch_name == null)
    {

	// Function
	var func = function(response) // callback
	{

	    if(!response.success)
		alert(response.message);

	    else
	    {
		
		// notify user was added
		alert(response.message);

		// send back to login screen
		window.location.href = "login.html";
	    }

	};

	// REQUEST TO WEBSERVICE
	$.get(WS_url, {method: "addCustomer", fname: fname, lname: lname, uname: uname, pw: pw, email: email, branch_name: branch_name}, func);


    }
}

// load list of branches into dropdown for customer to choose 
// for addCustomer page
function loadBranchlist_addCustomer()
{
    
    var func = function(response)
    {
	if(!response.success)
	    alert(response.message);

	else
	{
	    
	    // put branch names in dropdown
	    var list = response.data;
	    
	    for(var i = 0; i < list.length; i++){
		var descript = $('<option/>', {text: list[i], value : list[i]});
		descript.appendTo("#branchlist")
	    }
	}

    }
    
    $.get(WS_url, {method: "getBranches"}, func);
    
    
}




