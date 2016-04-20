/* INCLUDES ALL JAVASCRIPT FUNCTIONS FOR WEBSITE
 */

// webservice URL
var WS_url = "webservice.php/";


/////// FUNCTIONS FOR ADDITEM.php //////////

function loadAddItem(){
    loadIngredients();
    loadAdminBranchlist();
}

// populate dropdown with admin's branches
function loadAdminBranchlist(){
    $.get(WS_url, {method: "getAdminBranchlist"}, function(response){
	if(response.success){
	    
	    for(var i = 0; i < response.data.length; i++){
		
		var descript = $('<option/>', {id: response.data[i].id, text: response.data[i].bname+" (ID: "+response.data[i].id+")", value : response.data[i].bname});
		descript.appendTo("#branchlist")
	    }

	}else{
	    alert("Branch list cannot be loaded.");
	}
    });
}

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
    var restrictions = $("#restrictions").val().split(",");

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
    $.get(WS_url, {method: "addIngredient", name: name, calories: calories, restrictions: restrictions}, func);
}

function addFoodItem()
{

    // Get the fields needed
    var name = $("#itemName").val();
    var mealType = $("#mealType").val();
    var totalCalories = $("#totalCalories").val();
    var ingredients = [];
    var branch = $("#branchlist").children(":selected").attr("id");



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
    $.get(WS_url, {method: "addFoodItem", name: name, mealType: mealType, totalCalories: totalCalories, ingredients: ingredients, branch: branch}, func);
}

////// FUNCTIONS FOR  ADDCUSTOMER.php //////

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
	    window.location.href = "login.php";
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
		descript.appendTo("#branchlist");
	    }
	}

    };
    
    $.get(WS_url, {method: "getBranches"}, func);
    
    
}

////// FUNCTIONS FOR  HOMEADMIN.php //////

// load branch menu
// loads default menu
// takes in array of restrictions
function loadBranchMenu(branchId){
    
    // reset menu
    var list = $("#menu");
    list.empty();
    
    // get branch items from db
    $.get(WS_url, {method: "getBranchItems", bid: branchId}, function(response){
	
	menu = response.menu;

	// get through all the tuples
	$.each(menu, function(key, value)
	{
	    if(response.success){
		item = value;
		
		// clear restrictions if there is none
		if(item.restrictions == null)
		    item.restrictions = "";
		
		$("#menu").append('<tr><td>'+key+'</td><td>'+item.ingredients+'</td><td>'+item.restrictions+'</td></tr>');
	    }
	    else{
		alert("something derped");
	    }
	    
	});
    });

   
}


// adds branch to list
function addBranch(){
    
    // get branch name
    bname = $("#branchName").val();
    bid = $("#branchId").val();

    // insert to db
    $.get(WS_url, {method: "addBranch", bname: bname, bid: bid}, function(response){
	if(!response){
	    alert("Branch cannot be inserted! Branch ID may already exist.");
	}
    });

    // update list of branches
    var list = $('#branches');
    list.empty(); // delete everything in the element
     $("#branchName").val("");
    $("#branchId").val("");
    getBranches();
}

// creates list of links of branches based on logged in admin
function getBranches(){

    $.get(WS_url, {method: "getAdminBranchlist"}, function(response){
	if(response.success){
	    
	    for(var i = 0; i < response.data.length; i++){
		
		$("#branches").append('<li id="'+response.data[i].id+'"><a href="#" onclick="loadBranchMenu('+response.data[i].id+')">'+response.data[i].bname+'</a></li>');
	    }

	}else{
	    alert("Branch list cannot be loaded.");
	}
    });

}

function loadAdmin(){

    // get username of admin
    $.get(WS_url, {method: "getUsername"}, function(response){
	
	if(response.success)
	    $('#fname').text(response.uname);
	else
	    alert(response.uname);
    });
    

    getBranches();

    // load menu of first branch on list
    loadBranchMenu($('ul#branches li:first').attr("id"));
    
}

//////// FUNCTIONS FOR LOGIN.php //////////
function login(){
    
    // get values
    var uname = $("#username").val();
    var pw = $("#password").val();
    var isAdmin = $("#adminflag").is(":checked");
    
    // check admin table
    if(isAdmin){
	$.get(WS_url, {method: "adminLogin", uname: uname, pw: pw}, function(response){
	    if(response.success){
		window.location.href = "homeAdmin.php?"+response.sid;
	    }
	    else{
		alert(response.message);
	    }
	});
    }
    // check customer table
    else{

	$.get(WS_url, {method: "customerLogin", uname: uname, pw: pw}, function(response){
	    if(response.success){
		// send back to customer's homepage
		window.location.href = "homeCustomer.php?"+response.sid;
	    }
	    else{
		// notify user wrong cred
		alert(response.message);
	    }
	});
	
    }
    
}

    //////////// HOMECUSTOMER.php ////////////

// saves checked items as customer's fave
function saveFavourites(){
    
    // initialize favourites array to be sent to db
    var faves = new Array();

    // check checked bfast items
    $("#breakfast").find('input[type="checkbox"]:checked').each(function (){
	faves.push($(this).attr("id"));
    });

    // check checked lunch items
    $("#lunch").find('input[type="checkbox"]:checked').each(function (){
	faves.push($(this).attr("id"));
    });

    // check checked dessert items
    $("#dessert").find('input[type="checkbox"]:checked').each(function (){
	faves.push($(this).attr("id"));
    });

    // check checked bfast items
    $("#beverage").find('input[type="checkbox"]:checked').each(function (){
	faves.push($(this).attr("id"));
    });

    var toDelete = new Array();
    // check checked t items to delete
    $("#favourites_table").find('input[type="checkbox"]:checked').each(function (){
	toDelete.push($(this).attr("id"));
    });

    if(faves.length == 0){
	faves = -1;
    }

    if(toDelete.length == 0){
	toDelete = -1;
    }


    $.get(WS_url, {method: "saveFavourites", favourites: faves, todelete: toDelete}, function(response){
	if(!response.success){
	    alert(response.message);
	    
	}
    });

    // reset array
    // delete array
    var list = $("#favourites_table");
    list.empty();
    getFavourites();
   
}


// calls functions for customer's homepage	 
function loadCustomer(){
    getFavourites();
    loadMenu();
}

// loads customer's favourites
function getFavourites(){

    $.get(WS_url, {method: "getFavourites"}, function(response){
	if(response.success){
	    
	    for(var i = 0; i < response.data.length; i++){

		// get each item
		item = response.data[i];
		
		if(item.restrictions == null){
		    item.restrictions = "";
		}

		// insert into table in html
		$('#favourites_table').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td><td align="center"><input type="checkbox" id="'+item.name+'"></td></tr>');
	    }

	   

	}else{
	    alert(response.message);
	}
    });

}



// loads default menu
// takes in array of restrictions
function loadMenu(){
    
    // check if there are restrictions selected
    lactose = $("#Lactose").is(":checked");
    gluten = $("#Gluten").is(":checked");
    cel = $("#Celiacs").is(":checked");
    veget = $("#Vegetarian").is(":checked");
    vegan = $("#Vegan").is(":checked");
    lowcal = $("#LowCal").is(":checked");
    lowfat = $("#LowFat").is(":checked");
    
    // add checked restrictions into array
    restrictions = new Array();
    if(lactose)
	restrictions.push("Lactose Intolerance");
    if(gluten)
	restrictions.push("Gluten Intolerance");
    if(cel)
	restrictions.push("Celiac's Disease");
    if(veget)
	restrictions.push("Vegetarianism");
    if(vegan)
	restrictions.push("Vegan");
    if(lowcal)
	restrictions.push("Low Calorie Diet");
    if(lowfat)
	restrictions.push("Low Fat Diet");
    
    // set restrictions variable to -1 if none of checkboxes are checked
    if(restrictions.length == 0){
	restrictions = -1;
    }
    // reset tables if restriction has at least one checkbox checked
    else{
	$("#breakfast_body").empty();
	$("#lunch_body").empty();
	$("#dessert_body").empty();
	$("#beverage_body").empty();
    }

    // get all items from db
    $.get(WS_url, {method: "loadCustomerMenu", res: restrictions}, function(response){
	
	// display first name of user
	$('#fname').text(response.fname);

	menu = response.menu;

	// get through all the tuples
	for(var i = 0 ; i < response.menu.length; i++)
	{
	    
	    item = menu[i];
	    
	    // clear restrictions if there is none
	    if(item.restrictions == null)
		item.restrictions = "";
	    // skip 
	    else if($.inArray("-1", item.restrictions) != -1){
		continue;
	    }

	    if(location.href.indexOf("defaultHome.php") != -1){
		alert("hi");
		// if meal type = breakfast
 		if(item.type.localeCompare("Breakfast") == 0
		   || item.type.localeCompare("breakfast") == 0){
		    $('#breakfast tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td></tr>');
		}
		else if(item.type.localeCompare("Lunch") == 0
			|| item.type.localeCompare("lunch") == 0){
		    $('#lunch tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td></tr>');
		}
		else if(item.type.localeCompare("Dessert") == 0
			|| item.type.localeCompare("dessert") == 0){
		    $('#dessert tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td></tr>');
		}
		else if(item.type.localeCompare("Beverages") == 0
			|| item.type.localeCompare("beverages") == 0){
		    $('#beverage tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td></tr>');
		}
	    }
	    else{
		// if meal type = breakfast
 		if(item.type.localeCompare("Breakfast") == 0
		   || item.type.localeCompare("breakfast") == 0){
		    $('#breakfast tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td><td><input type="checkbox" id="'+item.name+'"></td></tr>');
		}
		else if(item.type.localeCompare("Lunch") == 0
			|| item.type.localeCompare("lunch") == 0){
		    $('#lunch tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td><td><input type="checkbox" id="'+item.name+'"></td></tr>');
		}
		else if(item.type.localeCompare("Dessert") == 0
			|| item.type.localeCompare("dessert") == 0){
		    $('#dessert tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td><td><input type="checkbox" id="'+item.name+'"></td></tr>');
		}
		else if(item.type.localeCompare("Beverages") == 0
			|| item.type.localeCompare("beverages") == 0){
		    $('#beverage tbody:last').append('<tr><td>'+item.name+'</td><td>'+item.calories+'</td><td>'+item.restrictions+'</td><td><input type="checkbox" id="'+item.name+'"></td></tr>');
		}

	    }
	}


    });

    
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
    $.get(WS_url, {method: "killsession"});
    
}



