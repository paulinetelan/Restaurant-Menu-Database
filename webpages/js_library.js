/* INCLUDES ALL JAVASCRIPT FUNCTIONS FOR WEBSITE
 */

// webservice URL
var WS_url = "webservice.php/";


/////// FUNCTIONS FOR ADDITEM.html //////////

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

////// FUNCTIONS FOR  ADDCUSTOMER.html //////

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
	alert("Invalid input!");
	return;
    }

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
    $.get(WS_url, {method: "addCustomer", uname: uname, pw: pw, fname: fname, lname: lname, email: email, branch_name: branch_name}, func);



}

// load list of branches into dropdown for customer to choose 
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

////// FUNCTIONS FOR  HOMEADMIN.html //////

// NOT FINISHED
function initializeListofBranches(){

    // Create list of branch link
    var ulist = document.getElementById("branches");

    for(var i = 0; i < 5; i++){
	var a = document.createElement("a");
	var newItem = document.createElement("li")
	a.textContent = i;
	a.setAttribute('href', "#");
	newItem.appendChild(a);
	ulist.appendChild(newItem);
    }	

}

//////// FUNCTIONS FOR LOGIN.html //////////
function login(){
    
    // get values
    var uname = $("#username").val();
    var pw = $("#password").val();
    var isAdmin = $("#adminflag").is(":checked");
    
    // TODO: check admin table
    if(isAdmin){

    }
    // check customer table
    else{

	var func = function(response)
	{
	    if(!response.success)
		alert(response.message);

	    else
	    {
		if(response.data){
		    // send back to customer's homepage
		    window.location.href = "homeCustomer.html";
		}
		else{
		    // notify user wrong cred
		    $("#invalidalert").show();
		}
	    }


	}

	

	$.get(WS_url, {method: "customerLogin", uname: uname, pw: pw}, func);

    
    }
    
}



