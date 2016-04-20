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
      	<big>Hello, <div style="display: inline-block" id = "fname"><!-- insert first name of logged in user here --></div></big> <br>
      	<!-- log out link -->
      <a href = "login.php" onclick = "killsession()" class="btn btn-primary"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> Log out</a>
    	</div>

      <h3>Branches </h3>
      <ul id = "branches">
     	<!-- list branches here -->
      </ul>

      <br>
      <!--  add branches -->
      <h4> Add Branch </h4>
      Branch ID: <input type = "text" id = "branchId" > <br><br>
      Branch Name: <input type = "text" id = "branchName" > <br><br>
      <button class="btn btn-success" onclick="addBranch()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add</button>
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
      <a href = "addItem.php" class="btn btn-success"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span> Add item </a>

    </div>

<?php include('footer.php'); ?>
