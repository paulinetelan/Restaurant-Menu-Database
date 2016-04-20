<?php include('header.php'); ?>

<script>
// Execute this function when page is ready
// See http://api.jquery.com/ready/
$(loadCustomer);
</script>

    <!-- user info -->
    <div class = "row">
      <big>Hello, <div style="display: inline-block" id = "fname"><!-- insert first name of logged in user here --></div></big><br>
      <!-- log out link -->
      <a href = "login.php" onclick = "killsession()" class="btn btn-primary"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log out</a>
    </div>




    <div class = "row">
      <h4>Check off any dietary restrictions you may have:</h4>
      <!-- Reached either from Profile(users) or from main screen(guests) -->
      <form action="">
	<label><input type="checkbox" name="restriction" id="Lactose"> Lactose Intolerance</label><br>
	<label><input type="checkbox" name="restriction" id="Gluten"> Gluten Intolerance</label><br>
	<label><input type="checkbox" name="restriction" id="Celiacs"> Celiac's Disease</label><br>
	<label><input type="checkbox" name="restriction" id="Vegetarian"> Vegetarian</label><br>
	<label><input type="checkbox" name="restriction" id="Vegan"> Vegan</label><br>
	<label><input type="checkbox" name="restriction" id="LowCal"> Low Calorie Diet</label><br>
	<label><input type="checkbox" name="restriction" id="LowFat"> Low Fat Diet</label><br>
      </form>
      <button type="button" onclick="loadMenu()" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Submit</button>
    </div>
    <br>

    <!-- favourites -->
    <div class = "row">
      <h3><u>Favourites</u></h3>
      <table style="width:100%; ">
      <thead>
	<tr>
	  <th> Name </th>
	  <th> Calories </th>
	  <th> Restriction/s </th>
	  <th> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></th>
	</tr>
	</thead>
	<tbody id="favourites_table">
	<!-- populated by getFavourites() -->
	</tbody>
      </table>
    </div>
<br>
    <button type="button" onclick="saveFavourites()" class="btn btn-primary"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> Save Favourites</button> <!--adds checked items to Profile favourites-->
    <!--If profile session==null, go to registration page w/ message "you must sign up to save favourites" -->

    <br>
    <br>
    <!-- takes restrictions as database conditions, displays menu below -->
    <h3><u>Suggested Menu Items</u></h3>
    <!--display safe items with checkboxes -->
    <b>Breakfast</b>
    <br>
    <form action="">
      <!--bfast items-->
      <table style="width:100%" id = "breakfast">
	<thead>
	  <tr>
	    <th id = "bf_name">Name</th>
	    <th id = "bf_calories">Calories</th>
	    <th id = "bf_rest">Restrictions</th>
	    <th id = "bf_fav">Favourite</th>
	  </tr>
	</thead>
	<tbody id = "breakfast_body">
	</tbody>
      </table>
    </form>
    <br>
    <b>Lunch</b>
    <br>
    <form action="">
      <!--lunch items-->
      <table style="width:100%" id = "lunch">
	<thead>
	  <tr>
	    <th id = "lunch_name">Name</th>
	    <th id = "lunch_calories">Calories</th>
	    <th id = "lunch_rest">Restrictions</th>
	    <th id = "lunch_fav">Favourite</th>
	  </tr>
	</thead>
	<tbody id = "lunch_body">
	</tbody>
      </table>
    </form>
    <br>
    <b>Pastries and Desserts</b>
    <br>
    <form action="">
      <!--pastries || desserts-->
      <table style="width:100%" id = "dessert">
	<thead>
	  <tr>
	    <th id = "dess_name">Name</th>
	    <th id = "dess_calories">Calories</th>
	    <th id = "dess_rest">Restrictions</th>
	    <th id = "dess_fav">Favourite</th>
	  </tr>
	</thead>
	<tbody id = "dessert_body">
	</tbody>
      </table>
    </form>
    <br>
    <b>Beverages</b>
    <br>
    <form action="">
      <!-- beverages -->
      <table style="width:100%" id="beverage">
	<thead>
	  <tr>
	    <th id = "bev_name">Name</th>
	    <th id = "bev_calories">Calories</th>
	    <th id = "bev_rest">Restrictions</th>
	    <th id = "bev_fav">Favourite</th>
	  </tr>
	</thead>
	<tbody id = "beverage_body">
	</tbody>
      </table>
    </form>
    <br>
    <br>
    <button type="button" onclick="saveFavourites()" class="btn btn-primary"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> Save Favourites</button> <!--adds checked items to Profile favourites-->
    <!--If profile session==null, go to registration page w/ message "you must sign up to save favourites" -->

<?php include('footer.php'); ?>
