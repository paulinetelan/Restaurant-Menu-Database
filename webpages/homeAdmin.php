<?php include('header.php'); ?>

<script>
// Execute this function when page is ready
// See http://api.jquery.com/ready/
$(loadAdmin);
</script>

      <h3> (Admin Edit mode) </h3>
    </header>

    <div class = "col-lg-6">

    	<!-- user info -->
    	<div class = "row">
      	Hello, <div style="display: inline-block" id = "fname"><!-- insert first name of logged in user here --></div> <br>
      	<!-- log out link -->
      	<a href = "login.php" onclick = "killsession()">Log out</a>
    	</div>

      <h3>Branches </h3>
      <ul id = "branches">
     	<!-- list branches here -->
      </ul>

      <br>
      <!--  add branches -->
      <h4> Add Branch </h4>
      Branch ID: <input type = "text" id = "branchId" > <br><br>
      Branch Name: <input type = "text" id = "branchName" > <br>
      <input type = "submit" value = "Add" class="btn btn-primary" onclick="addBranch()">
    </div>

    <div class = "col-lg-6">
    <br><br>
      <h3>Menu </h3>
      <!-- MENU_ITEM  INGREDIENT/S  DIETARY_RESTRICTION FAVOURITE(checkbox?) -->
      <table border = "1">
	<tr>
	  <th> Item </th>
	  <th> Ingredient/s </th>
	  <th> Dietary Restriction/s </th>
	</tr>
	<tbody id = "menu">
	  <!--- populated with clicked branch's menu -->
	</tbody>
      </table>

      <br>
      
      <!-- link to add items -->
      <a href = "addItem.php"> Add item </a>

    </div>

<?php include('footer.php'); ?>
