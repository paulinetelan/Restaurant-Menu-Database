<?php
   $user = 'root';
   $password = 'root';
   $db = 'something';
   $host = 'localhost';
   $port = 8889;
?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset = "utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Restaurant Menu</title>

    <link href = "bootstrap.css" rel = "stylesheet">
  </head>

<header class = "container">
 <h1>Good Earth Menu</h1>

</header>

<div class = "col-lg-4">
  <h3> Log-in </h3>

<!-- log in form over here?? -->
  Username: <input type = "text" name = "username"><br> <br>
  Password: <input type = "text" name = "password"><br> <br>
  Admin? <input type = "checkbox" name = "adminflag" value = "Admin"> <br> <br>
  <input type = "submit" value = "Log in">

</div>

<div class = "col-lg-4">
  <h3>Branches </h3>
  <!-- list branches here -->
</div>

<div class = "row">
  <h3>Menu </h3>
  <!-- MENU_ITEM  INGREDIENT/S  DIETARY_RESTRICTION FAVOURITE(checkbox?) -->

</div>

</html>
