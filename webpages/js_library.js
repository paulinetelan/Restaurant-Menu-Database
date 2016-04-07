/* INCLUDES ALL JAVASCRIPT FUNCTIONS FOR WEBSITE
 */

// webservice URL
var WS_url = "webservice.php/";


/////// FUNCTIONS FOR ADDITEM.html //////////

// fetch ingredient names from database and load it with checkbox list 
function loadIngredients(){
    var func = function(response)
    {
		var br = $('<br/>');
		var list = $('#listOfIngredients');
		list.empty(); // delete everything in the element

		// Create list of ingredients with checkbox
		response.ingredients.forEach(function(obj, i){
			// ID allows clicking the label to toggle the checkbox
			var text = obj.name + " (" + obj.calories + " calories)";
			var id = 'ingredient'+i; // i is the index [0, n)
			var checkbox = $('<input/>', {
				type:'checkbox',
				value: obj.name,
				id:id,
				// The class will be useful for addFoodItem
				class:'ingredientCheckbox'
			});
			var label = $('<label/>', {text: text, for:id})

			// append the checkbox, label, then br tag
			list.append(checkbox, label, '<br/>');
		});
	};
    $.get(WS_url, {method: "loadIngredients"}, func);
}

function addIngredient()
{

    // Get the fields needed
    var name = $("#ingredientName").val();
    var calories = $("#ingredientCalories").val();

    // check for valid inputs
    if(name == "" || calories == "")
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

	    // refresh ingredients list
	    loadIngredients();
	}

    }

    // REQUEST TO WEBSERVICE
    $.get(WS_url, {method: "addIngredient", name: name, calories: calories}, func);
}

function addFoodItem()
{

    // Get the fields needed
    var name = $("#itemName").val();
    var mealType = $("#mealType").val();
	var totalCalories = $("#totalCalories").val();
	var ingredients = [];

	// Get all HTML elements with class ingredientCheckbox
	$('.ingredientCheckbox').each(function(i,e){
		// Check if the box is checked
		// NOTE: e is DOM element, not JQuery object
		if (e.checked)
		{
			ingredients.push(e.value);
		}
	});

    // check for valid inputs
    if(name == "" || mealType == "" || totalCalories == "")
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
	}

    }

    // REQUEST TO WEBSERVICE
    $.get(WS_url, {method: "addFoodItem", name: name, mealType: mealType, totalCalories: totalCalories, ingredients: ingredients}, func);
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

    }

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

    };
    
    $.get(WS_url, {method: "getBranches"}, func);
    
    
}

////// FUNCTIONS FOR  HOMEADMIN.html //////

// NOT FINISHED
// creates list of links of branches based on logged in admin
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

	$.get(WS_url, {method: "customerLogin", uname: uname, pw: pw}, function(response){
	    if(response.success){
		// send back to customer's homepage
		window.location.href = "homeCustomer.html?"+response.sid;
	    }
	    else{
		// notify user wrong cred
		alert(response.message);
	    }
	});
	
    }
  
}

//////////// HOMECUSTOMER.html ////////////

// loads menu
// TODO: finish all other fields (dessert, etc.) and add restrictions 

function loadCustomer(){
    
    sid = getSid(document.location.href);
    
    if(sid != null){
	$.get(WS_url, {method: "loadCustomerMenu"}, function(response){
	    
	    // display first name of user
	    $('#fname').text(response.fname);

	    menu = response.menu;

	    // get through all the tuples
	    for(var i = 0 ; i < response.menu.length; ++i)
	    {
	
		item = menu[i];

		// if meal type = breakfast
 		if(item.type.localeCompare("Breakfast") == 0
		   || item.type.localeCompare("breakfast") == 0){
		    $('#breakfast tr:last').after('<tr><td>'+item.name+'</td><td>'+item.calories+'</td></tr>');
		}
	    }
	});
    }else{
	alert("CALM DA FUQ DOWN");
    }
    
}


////////// MISC /////////////

// gets session id from url
function getSid(url){

    var sid = "";
    var start = false;
    for(var i = 0; i < url.length; i++){
	if(start){
	    sid += url.charAt(i);
	}
	if(url.charAt(i) == '?'){
	    start = true;
	}
    }

    return sid;
}

function killsession(){
    $.get(WS_url, {method: killsession});
    
}



