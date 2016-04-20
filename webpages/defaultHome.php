<?php include('header.php'); ?>

<script>
// Execute this function when page is ready
// See http://api.jquery.com/ready/
$(loadMenu);
</script>

<h2>Welcome to our GoodEarth Online Menu!</h2> 

   
    <!-- takes restrictions as database conditions, displays menu below -->
    <h3><u> Menu Items</u></h3>
    <!--display safe items with checkboxes -->
    <b>Breakfast</b>
    <br>
    <div id="breakfast_div" style="overflow-y: scroll; height: 200px;">
      <form action="">
	<!--bfast items-->
	<table style="width:100%" id = "breakfast">
	  <thead>
	    <tr>
	      <th id = "bf_name">Name</th>
	      <th id = "bf_calories">Calories</th>
	      <th id = "bf_rest">Restrictions</th>
	    </tr>
	  </thead>
	  <tbody id = "breakfast_body">
	  </tbody>
	</table>
      </form>
    </div>
    <br>
    <b>Lunch</b>
    <br>
    <div id="lunch_div" style="overflow-y: scroll; height: 200px;">
      <form action="">
	<!--lunch items-->
	<table style="width:100%" id = "lunch">
	  <thead>
	    <tr>
	      <th id = "lunch_name">Name</th>
	      <th id = "lunch_calories">Calories</th>
	      <th id = "lunch_rest">Restrictions</th>
	    </tr>
	  </thead>
	  <tbody id = "lunch_body">
	  </tbody>
	</table>
      </form>
    </div>
    <br>
    <b>Pastries and Desserts</b>
    <div id="dessert_div" style="overflow-y: scroll; height: 200px;">
      
      <br>
      <form action="">
	<!--pastries || desserts-->
	<table style="width:100%" id = "dessert">
	  <thead>
	    <tr>
	      <th id = "dess_name">Name</th>
	      <th id = "dess_calories">Calories</th>
	      <th id = "dess_rest">Restrictions</th>
	    </tr>
	  </thead>
	  <tbody id = "dessert_body">
	  </tbody>
	</table>
      </form>
    </div>
    <br>
    <b>Beverages</b>
    <div id="beverage_div" style="overflow-y: scroll; height: 200px;">
      
      <br>
      <form action="">
	<!-- beverages -->
	<table style="width:100%" id="beverage">
	  <thead>
	    <tr>
	      <th id = "bev_name">Name</th>
	      <th id = "bev_calories">Calories</th>
	      <th id = "bev_rest">Restrictions</th>
	    </tr>
	  </thead>
	  <tbody id = "beverage_body">
	  </tbody>
	</table>
      </form>
    </div>

<div class = "row">
      <h4>Check off any dietary restrictions you may have:</h4>
      <!-- Reached either from Profile(users) or from main screen(guests) -->
      <form action="">
	<input type="checkbox" name="restriction" id="Lactose">Lactose Intolerance<br>
	<input type="checkbox" name="restriction" id="Gluten">Gluten Intolerance<br>
	<input type="checkbox" name="restriction" id="Celiacs">Celiac's Disease<br>
	<input type="checkbox" name="restriction" id="Vegetarian">Vegetarian<br>
	<input type="checkbox" name="restriction" id="Vegan">Vegan<br>
	<input type="checkbox" name="restriction" id="LowCal">Low Calorie Diet<br>
	<input type="checkbox" name="restriction" id="LowFat">Low Fat Diet<br>
      </form><br>
      <button type="button" onclick="loadMenu()">Submit</button>
    </div>

<?php include('footer.php'); ?>
