<!-- Page for adding a food item
     TODO: Have to add "add ingredient" option
     ?> -->

<?php include('header.php'); ?>

<script>
// Execute this function when page is ready
// See http://api.jquery.com/ready/
$(loadAddItem);
</script>

<div class="container">
  <div class="row">
    <div class="col-lg-6">
    <a href="homeAdmin.php">Back to home</a>
      <h3> Add Food Item </h3>
      <!-- The return false is to prevent the form from actually submitting -->
      <form onsubmit="addFoodItem(); return false;">

      Name: <input type = "text" id = "itemName"><br> <br>

      Meal type: <input type = "text" id = "mealType"><br> <br>

      Ingredient/s: 
      <div class = "well sidebar-nav" id = "listOfIngredients">
      <!-- load list of pre added ingredients here as checkbox-->
      </div>

      Total Calories: <input type = "text" id = "totalCalories"> <br> <br>
      Branch: <select id = "branchlist" class="form-control">
          <!-- Populated by  method -->
        </select> <br><br>

      <input type = "submit" value = "Add Item" class="btn btn-primary"> 

      </form>
    </div>

    <!-- ingredient form here -->
    <div class = "col-lg-6">
    <br>
      <h3>Add Ingredient</h3>
      <!-- The return false is to prevent the form from actually submitting -->
      <form onsubmit="addIngredient(); return false;">
      Name: <input type = "text" id = "ingredientName"> <br><br>
      Number of Calories: <input type = "text" id = "ingredientCalories"> <br><br>
      Restrictions (separated with a comma): <input type = "text" id = "restrictions"> <br><br>
      

      <input type = "submit" value = "Add Ingredient" class="btn btn-primary">
      </form>
    </div>
  </div>
</div>

<?php include('footer.php'); ?>
